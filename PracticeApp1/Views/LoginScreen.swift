//
//  LoginScreen.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 09/03/21.
//

import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var title: String = "Login"
    @State private var buttonText : String = "Not a user? Register"
    @State private var logginToggle : Bool = false
    @State private var passwordValidationText : String = ""
    @State private var usernameValidationText : String = ""
    @State var showAlert : Bool = false
    @State var message : String = ""
    
    @Binding var selection: Int


//    "Password is mandatory"
//    "Username is mandatory"
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.system(size: 40))
                
            Spacer()
            
            VStack {
                HStack {
                    Text("Username: ")
                        .fixedSize()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack {
                        TextField("Enter username", text: $username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        Text(usernameValidationText)
                            .foregroundColor(.red)
                            .font(.system(size:12))
                    }
                    
                }
                
                HStack {
                    Text("Password: ")
                        .fixedSize()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack {
                        SecureField("Enter password", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        Text(passwordValidationText)
                            .foregroundColor(.red)
                            .font(.system(size:12))
                    }
                    
                }
                
                Button(action: {
                    logginToggle ? RegisterUser() : LoginUser(account: username)
                    selection = 4
                }) {
                    Text(title)
                        .font(.system(size: 30))
                }.alert(isPresented: $showAlert) { () -> Alert in
                    Alert(title:Text("Alert!"), message: Text(message), dismissButton: .default(Text("Ok")))
                }
                Divider()
                Button(action:{
                    usernameValidationText = ""
                    passwordValidationText = ""
                    title = logginToggle ? "Login" : "Register"
                    buttonText = logginToggle ? "Not a user? Register" : "Switch to Login"
                    logginToggle = !logginToggle
                }) {
                    Text(buttonText)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
    
    func RegisterUser() -> Void{
        usernameValidationText = ""
        passwordValidationText = ""
        if(isStrongPass(pass: password) && username != "" && password != "" ){
            let kcw = KeychainWrapper()
            do {
                try kcw.storeGenericPasswordFor(
                    account: username,
                    password: password)
            } catch let error as KeychainWrapperError {
                message = "Exception setting password: \(error.message ?? "no message")"
                showAlert = true
                print(message)
            } catch {
                message = "An error occurred setting the password."
                showAlert = true
                print(message)
            }
            
        }else if(username == ""){
            usernameValidationText = "User name can not be empty"
            print(usernameValidationText)
        }
        else if(password == ""){
            passwordValidationText = "Password can not be empty"
            print(passwordValidationText)
        }
        else{
            passwordValidationText = "Weak password! Password should contain minimum 8 characters, at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character"
            print(passwordValidationText)
        }
    }
    
    func getStoredPassword(username: String) -> String? {
      let kcw = KeychainWrapper()
      if let password = try? kcw.getGenericPasswordFor(
        account: username) {
        return password
      }

      return nil
    }
    
    func LoginUser(account: String) -> Void {
        if(username == ""){
            usernameValidationText = "User name can not be empty"
            print(usernameValidationText)
        }
        else if(password == ""){
            passwordValidationText = "Password can not be empty"
            print(passwordValidationText)
        }
        else{
            if let safePass = getStoredPassword(username: account){
                if(safePass == password){
                    message = "User Authenticated"
                    DispatchQueue.main.async {
                        self.selection = 1
                    }
                    showAlert = true
                    print(message)
                }else{
                    message = "Authentication Failed"
                    showAlert = true
                    print(message)
                }
            }
            else{
                message = "Authentication Failed"
                showAlert = true
                print(message)
            }
        }
    }
    
    func isStrongPass(pass: String) -> Bool {
        let passRegx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        return NSPredicate(format: "SELF MATCHES %@", passRegx).evaluate(with: pass)
        
    }
}

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}
