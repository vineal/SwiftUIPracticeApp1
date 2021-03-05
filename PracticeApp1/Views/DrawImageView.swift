//
//  DrawImageView.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 05/03/21.
//

import SwiftUI

struct DrawImageView: View {
    //    let bandImage : String
    let imageWidth : Float?
    let imageHeight : Float?
    let bandImageArr : [String]
    init(imageWidth : Float?,imageHeight : Float?, bandImageArr: [String]){
        //        self.bandImage = bandImage
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.bandImageArr = bandImageArr
    }
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 10){
                let arrCount = bandImageArr.count
                ForEach(0..<arrCount){index in
                    if imageHeight == nil {
                        if imageWidth != nil{
                            RemoteImage(url: bandImageArr[index])
                                .aspectRatio(contentMode: .fit)
                                .frame(width: CGFloat(imageWidth!))
                        }
                        else{
                            RemoteImage(url: bandImageArr[index])
                                .aspectRatio(contentMode: .fit)
                                .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 70,
                                       minHeight: 0, maxHeight: UIScreen.main.bounds.height/2)
                        }
                    }else{
                        if imageWidth == nil{
                            RemoteImage(url: bandImageArr[index])
                                .aspectRatio(contentMode: .fit)
                                .frame(minWidth: 0,
                                       maxWidth: UIScreen.main.bounds.width - 70,
                                       maxHeight:CGFloat(imageHeight!))
                        }
                        else{
                            RemoteImage(url: bandImageArr[index])
                                .aspectRatio(contentMode: .fit)
                                .frame(width:CGFloat(imageWidth!),height: CGFloat(imageHeight!))
                        }
                        
                    }
                }
                
            }
        }
    }
}
