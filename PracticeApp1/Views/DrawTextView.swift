//
//  DrawTextView.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 05/03/21.
//

import SwiftUI

struct DrawTextView: View {
    @State var expandLineCount : Int = 0
    @State var lineLimitForText : Int = 4
    @State var textHeight: Float = 100
    @State private var truncated: Bool = false
    var bandText : String
    init(bandText: String) {
        self.bandText = bandText
    }
    var body: some View {
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
                                
                                Text("Read More")
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
    
    
    //MARK: - DETERMINE TRUNCATION
    //This function determines weather the text needs to show the show more text or not
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
}

struct DrawTextView_Previews: PreviewProvider {
    static var previews: some View {
        DrawTextView(bandText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }
}
