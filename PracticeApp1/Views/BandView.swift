//
//  bandView.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 02/03/21.
//

import SwiftUI

struct BandView: View {
    var band : Band
    
    init(band: Band) {
        self.band = band
    }
    
   
    
    var body: some View {
        VStack{
            if let bandImageArr = band.bandImage{
                if let imageHeight = band.imageHeight{
                    if let imageWidth = band.imageWidth{
                        DrawImageView(imageWidth : imageHeight,imageHeight : imageWidth,bandImageArr: bandImageArr)
                    }else{
                        DrawImageView(imageWidth : band.imageWidth,imageHeight : imageHeight,bandImageArr: bandImageArr)
                    }
                }else{
                    DrawImageView(imageWidth : band.imageWidth, imageHeight :  band.imageHeight,bandImageArr: bandImageArr)
                }
                
            }
            if let bandText = band.bandText{
                DrawTextView(bandText: bandText)
            }
        }
        .navigationBarHidden(true)
        .frame(minWidth: 0,
               maxWidth: .greatestFiniteMagnitude,
               minHeight: 0,
               maxHeight: .greatestFiniteMagnitude)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding()
        
    }
}

struct bandView_Previews: PreviewProvider {
    static var previews: some View {
        BandView(band: Band())
    }
}
