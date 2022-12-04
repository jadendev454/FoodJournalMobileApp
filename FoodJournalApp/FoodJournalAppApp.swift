//
//  FoodJournalAppApp.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/21.
//

import SwiftUI

@main
struct FoodJournalAppApp: App {
    
    //Vars
    @State var isDarkMode:Bool = false
    var body: some Scene {
        WindowGroup {
            TabView{
                HomeView(isDarkMode: $isDarkMode)
                    .tabItem {
                        Label("Journal", systemImage: "list.bullet.clipboard")
                    }.tag(1)
                SettingsView(isDarkMode: $isDarkMode)
                    .tabItem {
                        Label("Options", systemImage: "slider.horizontal.3")
                    }.tag(2)
            }
            .accentColor(Color(.systemYellow))
        }
    }
}
