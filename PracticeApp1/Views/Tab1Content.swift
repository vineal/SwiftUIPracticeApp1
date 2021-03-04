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
            NavigationView{
                List(bandsRepo.bands) { band in
                    BandView(band: band)
                }
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
