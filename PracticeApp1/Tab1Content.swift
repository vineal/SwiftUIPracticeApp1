//
//  Tab1Content.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 01/03/21.
//

import SwiftUI

struct Tab1Content: View {
    @ObservedObject var bandsRepo = Repository()
    var body: some View {
        VStack {
            List(bandsRepo.bands) { band in
                HStack{
                    if let bandImage = band.bandImage{
                        if let imageHeight = band.imageHeight{
                            if let imageWidth = band.imageWidth{
                                DrawImageView(bandImage :bandImage ,imageWidth : imageHeight,imageHeight : imageWidth)
                            }else{
                                DrawImageView(bandImage :bandImage ,imageWidth : imageHeight,imageHeight : imageHeight)
                            }
                        }else{
                            if let imageWidth = band.imageWidth{
                                DrawImageView(bandImage :bandImage ,imageWidth : imageWidth,imageHeight : imageWidth)
                            }
                            else{
                                DrawImageView(bandImage :bandImage ,imageWidth : 50.0, imageHeight : 50.0)
                            }
                        }
                        
                    }
                    if let bandText = band.bandText{
                        Text(bandText)
                            .padding()
                    }
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
                Spacer()
            }
        }
        .onAppear(){
            self.bandsRepo.getBands()
        }
    }
}

struct DrawImageView: View {
    let bandImage : String
    let imageWidth : Float
    let imageHeight : Float
    init(bandImage : String,imageWidth : Float,imageHeight : Float){
        self.bandImage = bandImage
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
    var body: some View {
        Image(bandImage)
            .resizable()
            .frame(
                width: CGFloat(imageWidth),
                height: CGFloat(imageHeight),
                alignment: .center
            )
            .padding()
    }
}

struct Tab1Content_Previews: PreviewProvider {
    static var previews: some View {
        Tab1Content()
    }
}
