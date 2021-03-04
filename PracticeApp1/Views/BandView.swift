//
//  bandView.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 02/03/21.
//

import SwiftUI

struct BandView: View {
    var band : Band
    @State var expandLineCount : Int = 0
    @State var lineLimitForText : Int = 4
    @State var textHeight: Float = 100
    @State private var truncated: Bool = false
    init(band: Band) {
        self.band = band
    }
    
    private func determineTruncation(_ geometry: GeometryProxy, text: String) {
        let total = text.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: 16)],
            context: nil
        )
        
        if total.size.height > geometry.size.height {
            self.truncated = true
        }
    }
    
    var body: some View {
        VStack{
            if let bandImage = band.bandImage{
                if let imageHeight = band.imageHeight{
                    if let imageWidth = band.imageWidth{
                        DrawImageView(bandImage :bandImage ,imageWidth : imageHeight,imageHeight : imageWidth)
                    }else{
                        DrawImageView(bandImage :bandImage ,imageWidth : imageHeight,imageHeight : imageHeight)
                    }
                }else{
                    DrawImageView(bandImage :bandImage ,imageWidth : nil, imageHeight :  band.imageHeight)
                }
                
            }
            if let bandText = band.bandText{
                
                Text(bandText)
                    .lineLimit(lineLimitForText)
                    .overlay(
                        GeometryReader{ proxy in
                            if(truncated){
                                if(expandLineCount < 2){
                                    Button(action: {
                                        expandLineCount+=1
                                        lineLimitForText+=lineLimitForText
                                        textHeight = Float(lineLimitForText) * 100
                                    }) {
                                        
                                        Text( "Read More")
                                            .underline()
                                            .font(.caption).bold()
                                            .padding(.leading, 8.0)
                                            .padding(.top, 4.0)
                                            .background(Color.white)
                                    }
                                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                                }
                                else{
                                    NavigationLink(destination: DetailScreen(bodyText: bandText)) {
                                        Text("Read More")
                                            .underline()
                                            .font(.caption).bold()
                                            .padding(.leading, 8.0)
                                            .padding(.top, 4.0)
                                            .background(Color.white)
                                            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                                        
                                    }
                                }
                            }
                        }
                    )
                    .background(GeometryReader { geometry in
                                        Color.clear.onAppear {
                                            self.determineTruncation(geometry, text: bandText)
                                        }
                                    })
                    .padding()
            }
        }
        .navigationBarHidden(true)
        .frame(minWidth: 0,
               maxWidth: .infinity)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding()
        .onAppear(){
            self.textHeight = Float(lineLimitForText) * 100.0
        }
    }
}

struct DrawImageView: View {
    let bandImage : String
    let imageWidth : Float?
    let imageHeight : Float?
    init(bandImage : String,imageWidth : Float?,imageHeight : Float?){
        self.bandImage = bandImage
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
    var body: some View {
        if imageHeight == nil {
            Image(bandImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }else{
            Image(bandImage)
                .resizable()
                .frame(
                    width: CGFloat(imageWidth!),
                    height: CGFloat(imageHeight!),
                    alignment: .center
                )
                .padding()
        }
    }
}

struct bandView_Previews: PreviewProvider {
    static var previews: some View {
        BandView(band: Band())
    }
}
