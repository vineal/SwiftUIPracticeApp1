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
            //MARK: - Band 1
            List(bandsRepo.bands) { band in
                HStack{
                    if let bandImage = band.bandImage{
                        if let imageHeight = band.imageHeight{
                            if let imageWidth = band.imageWidth{
                                Image(bandImage)
                                    .resizable()
                                    .frame(
                                        width: CGFloat(imageHeight),
                                        height: CGFloat(imageWidth),
                                        alignment: .center
                                    )
                                    .padding()
                            }else{
                                Image(bandImage)
                                    .resizable()
                                    .frame(
                                        width: CGFloat(imageHeight),
                                        height: CGFloat(imageHeight),
                                        alignment: .center
                                    )
                                    .padding()
                            }
                        }else{
                            if let imageWidth = band.imageWidth{
                                Image(bandImage)
                                    .resizable()
                                    .frame(
                                        width: CGFloat(imageWidth),
                                        height: CGFloat(imageWidth),
                                        alignment: .center
                                    )
                                    .padding()
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
                .background(Color.gray.opacity(0.2))
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

struct Tab1Content_Previews: PreviewProvider {
    static var previews: some View {
        Tab1Content()
    }
}
