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
                if(arrCount>1){
                    ForEach(0..<arrCount){index in
                        if imageHeight == nil || imageWidth == nil {
                            
                            RemoteImage(url: bandImageArr[index])
                        }
                        else{
                            RemoteImage(url: bandImageArr[index])
                                .frame(width:CGFloat(imageWidth!),height: CGFloat(imageHeight!))
                        }
                    }
                }
                else{
                    if imageHeight == nil || imageWidth == nil {
                        
                        RemoteImage(url: bandImageArr[0])
                    }
                    else{
                        RemoteImage(url: bandImageArr[0])
                            .frame(width:CGFloat(imageWidth!),height: CGFloat(imageHeight!))
                    }
                }
            }
        }
    }
}
