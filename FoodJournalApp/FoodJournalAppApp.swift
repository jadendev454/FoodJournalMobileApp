//
//  FoodJournalAppApp.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/21.
//

import SwiftUI

@main
struct FoodJournalAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                HomeView()
                    .tabItem {
                        Label("Journal", systemImage: "list.bullet.clipboard")
                    }.tag(1)
                SettingsView()
                    .tabItem {
                        Label("Options", systemImage: "slider.horizontal.3")
                    }.tag(2)
            }
            .accentColor(Color(.systemYellow))
        }
    }
}
