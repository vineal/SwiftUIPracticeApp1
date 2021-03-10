//
//  ContentView.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 01/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    var body: some View {
            TabView(selection: $selection) {
                Tab1Content().tabItem { Text("Tab 1") }.tag(1)
                Text("Tab 2").tabItem { Text("Tab 2") }.tag(2)
                Text("Tab 3").tabItem { Text("Tab 3") }.tag(3)
                Tab4Content(selection: $selection).tabItem { Text("Tab 4") }.tag(4)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
