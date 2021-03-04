//
//  Repository.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 01/03/21.
//

import Foundation

class Repository : ObservableObject{
    @Published var bands = [Band]()
    
    public var tabJsonString = """
{"bandArr":[{"bandImage": "sampleImage","bandText": "Sample text","imageHeight":50.0,"imageWidth":50.0},{"bandImage": "sampleImage","bandText":null,"imageHeight":null,"imageWidth":null},{"bandImage":null,"bandText": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.","imageHeight":null,"imageWidth":null}]}
"""
    func getBands(){
        let data = tabJsonString.data(using: .utf8)
        let decoder = JSONDecoder()
        if let safeData = data {
            do{
                let decodedArray = try decoder.decode(BandArray.self, from: safeData)
                DispatchQueue.main.async {
                    self.bands = decodedArray.bandArr
                }
                print(decodedArray)
            }catch{
                print(error)
            }
            
        }
    }
}
