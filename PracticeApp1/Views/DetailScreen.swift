//
//  DetailScreen.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 02/03/21.
//

import SwiftUI

struct DetailScreen: View {
    var bodyText : String
    init(bodyText: String){
        self.bodyText = bodyText
    }
    var body: some View {
        Text(bodyText)
            .padding()
            .frame(minWidth: 0,
                   maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding()
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(bodyText: "Body Text")
    }
}
