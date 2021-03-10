//
//  KeychainServices.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 10/03/21.
//

import Foundation

struct KeychainWrapperError: Error {
    var message: String?
    var type: KeychainErrorType
    
    enum KeychainErrorType {
        case badData
        case servicesError
        case itemNotFound
        case unableToConvertToString
    }
    
    init(status: OSStatus, type: KeychainErrorType) {
        self.type = type
        if let errorMessage = SecCopyErrorMessageString(status, nil) {
            self.message = String(errorMessage)
        } else {
            self.message = "Status Code: \(status)"
        }
    }
    
    init(type: KeychainErrorType) {
        self.type = type
    }
    
    init(message: String, type: KeychainErrorType) {
        self.message = message
        self.type = type
    }
}

class KeychainWrapper {
    func storeGenericPasswordFor(
        account: String,
        password: String
    ) throws {
        guard let passwordData = password.data(using: .utf8) else {
            print("Error converting value to data.")
            throw KeychainWrapperError(type: .badData)
        }
        
        //MARK: - Prepare Keychain query
        // 1
        let query: [String: Any] = [
            // 2
            kSecClass as String: kSecClassGenericPassword,
            // 3
            kSecAttrAccount as String: account,
            // 4
            kSecValueData as String: passwordData
        ]
        
        //MARK: - Use the query to add into Keychain
        // 1
        let status = SecItemAdd(query as CFDictionary, nil)
        // 2
        switch status {
        // 3
        case errSecSuccess:
            print("Password Stored Successfully")
            break
        // 4
        default:
            throw KeychainWrapperError(status: status, type: .servicesError)
        }
    }
    
    func getGenericPasswordFor(account: String) throws -> String {
        let query: [String: Any] = [
            // 1
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            // 2
            kSecMatchLimit as String: kSecMatchLimitOne,
            // 3
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status != errSecItemNotFound else {
          throw KeychainWrapperError(type: .itemNotFound)
        }
        guard status == errSecSuccess else {
          throw KeychainWrapperError(status: status, type: .servicesError)
        }
        
        // 1
        guard
          let existingItem = item as? [String: Any],
          // 2
          let valueData = existingItem[kSecValueData as String] as? Data,
          // 3
          let value = String(data: valueData, encoding: .utf8)
          else {
            // 4
            throw KeychainWrapperError(type: .unableToConvertToString)
        }

        // 5
        return value
    }
}
