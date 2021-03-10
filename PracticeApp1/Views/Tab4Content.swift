//
//  Tab4Content.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 09/03/21.
//

import SwiftUI

struct Tab4Content: View {
    @Binding var selection: Int
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: LoginScreen(selection: $selection)){
                    Text("Login/Register")
                }
                NavigationLink(destination: SettingsScreen()){
                    Text("Settings")
                }
            }.navigationTitle("Tab 4")
        }
        
    }
}
