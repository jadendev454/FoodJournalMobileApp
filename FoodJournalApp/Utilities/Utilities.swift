//
//  Utilities.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/22.
//

import Foundation
import SwiftUI


struct JournalItem: Identifiable {
    var id: UUID = UUID()
    
    let decription:String
    let date:Date
    let imageName:String
}


public class Utilities{
    static var journalEntries:[JournalItem] = []
    
    
    static func adjustJournalEntries(_ entry:[JournalItem]){
        journalEntries = entry
    }
    
    func popDemoEntries(_ amount:Int) {
        
        var _newEntryList:[JournalItem] = []
        
        for i in 0...amount{
            let entry = JournalItem.init(decription: "Food description eodjeojfoeofjeofoejfojefoejfoejfojejfooejfooejfojeofejofjoejfjfeofjeof eodjeodjoedoejoejdoedjoejdoeekdokeodoek", date: .now + TimeInterval(i), imageName: "placeholder_Image")
            
            _newEntryList.append(entry)
        }
        
        Utilities.adjustJournalEntries(_newEntryList)
        
        print("\(Utilities.journalEntries.count)")
    }
}
