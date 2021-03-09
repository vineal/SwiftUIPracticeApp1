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
    {
      "bandArr": [
        {
          "carousalArray": [
            {
              "id":1,
              "bandText": "Sample text",
              "bandImage": "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
              "imageHeight": null,
              "imageWidth": null
            },
            {
              "id":2,
              "bandText": "Sample text",
              "bandImage": "https://static.toiimg.com/photo/72975551.cms",
              "imageHeight": null,
              "imageWidth": null
            },
            {
              "id":3,
              "bandText": "Sample text",
              "bandImage": "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
              "imageHeight": null,
              "imageWidth": null
            },
            {
              "id":4,
              "bandText": "Sample text",
              "bandImage": "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
              "imageHeight": null,
              "imageWidth": null
            },
            {
              "id":5,
              "bandText": "Sample text",
              "bandImage": "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg",
              "imageHeight": null,
              "imageWidth": null
            }
          ]
        },
        {
          "carousalArray": [
            {
              "id":1,
              "bandText": null,
              "bandImage": "https://cdn-0.idownloadblog.com/wp-content/uploads/2018/07/Apple-logo-black-and-white.png",
              "imageHeight": null,
              "imageWidth": null
            }
          ]
        },
        {
          "carousalArray": [
            {
              "id":1,
              "bandImage": null,
              "bandText": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              "imageHeight": null,
              "imageWidth": null
            }
          ]
        }
      ]
    }
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
          "bandText": "1",
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
          "bandText": "3 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "4",
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
          "bandText": "6 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "7",
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
          "bandText": "9 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "10",
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
          "bandText": "12 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "13",
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
          "bandText": "15 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "16",
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
          "bandText": "18 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "19",
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
          "bandText": "21 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "22",
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
          "bandText": "24 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "25",
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
          "bandText": "27 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "28",
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
          "bandText": "30 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "31",
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
          "bandText": "33 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "34",
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
          "bandText": "36 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "37",
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
          "bandText": "39 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "40",
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
          "bandText": "42 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "43",
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
          "bandText": "45 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "46",
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
          "bandText": "48 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
        {
          "bandImage": [
            "https://images.ctfassets.net/hrltx12pl8hq/6bi6wKIM5DDM5U1PtGVFcP/1c7fce6de33bb6575548a646ff9b03aa/nature-photography-pictures.jpg?fit=fill&w=800&h=300",
            "https://static.toiimg.com/photo/72975551.cms",
            "https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270",
            "https://i.pinimg.com/564x/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg",
            "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"
          ],
          "bandText": "49",
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
          "bandText": "51 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "imageHeight": null,
          "imageWidth": null
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
        },
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
    var fullArr,displayArr : [Band]
    var currentPage: Int
    let numberOfEleInPage: Int
    var membersListFull : Bool
    init() {
        fullArr = []
        displayArr = []
        membersListFull = false
        numberOfEleInPage = 10
        currentPage = 1
    }
    func getBands(){
        
        let data = tabFormatedJSONString.data(using: .utf8)
        let decoder = JSONDecoder()
        if let safeData = data {
            do{
                let bandObj = try decoder.decode(BandArray.self, from: safeData)
                fullArr = bandObj.bandArr
                print(fullArr)
            }catch{
                print(error)
            }
            
        }
    }
    
    func getPagedBands(){
        print(currentPage)
        if(currentPage == 1){
            for index in 0..<numberOfEleInPage{
                displayArr.append(fullArr[index])
            }
            currentPage += 1
        }
        else if(fullArr.count>(currentPage*numberOfEleInPage)){
            for index in ((currentPage-1)*numberOfEleInPage)..<(numberOfEleInPage*currentPage){
                displayArr.append(fullArr[index])
            }
            currentPage += 1
        }
        else{
            membersListFull = true
            for index in ((currentPage-1)*numberOfEleInPage)..<fullArr.count{
                displayArr.append(fullArr[index])
            }
        }
        DispatchQueue.main.async {
            self.bands = self.displayArr
        }
    }
}
