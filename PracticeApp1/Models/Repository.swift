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
{"bandArr":[{"bandImage": ["https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300","https://static.toiimg.com/photo/72975551.cms","https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270","https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg","https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"],"bandText": "Sample text","imageHeight":null,"imageWidth":null},{"bandImage": ["https://cdn-0.idownloadblog.com/wp-content/uploads/2018/07/Apple-logo-black-and-white.png"],"bandText":null,"imageHeight":null,"imageWidth":null},{"bandImage":[],"bandText": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.","imageHeight":null,"imageWidth":null}]}
"""
    
    private var tabFormatedJSONString = """
    {
      "bandArr": [
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "Sample text",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://cdn-0.idownloadblog.com/wp-content/uploads/2018/07/Apple-logo-black-and-white.png"
          ],
          "bandText": null,
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": null,
          "bandText": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        }
      ]
    }
    """
               
    func getBands(){
        let data = tabFormatedJSONString.data(using: .utf8)
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
