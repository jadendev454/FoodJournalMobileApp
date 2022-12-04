//
//  SettingsView.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/22.
//

import SwiftUI
import UIKit

struct SettingsView: View {
    
    //Vars
    @Binding var isDarkMode:Bool
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Profiles")) {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                    Button("Clear All Journal Entries") {
                        Utilities.journalEntries = []
                    }
                }
            }
            .navigationTitle("Settings")
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isDarkMode: .constant(false))
    }
}
