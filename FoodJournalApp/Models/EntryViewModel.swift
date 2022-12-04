//
//  EntryViewModel.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/22.
//

import Foundation
import SwiftUI
import UIKit


struct EntryModelView: View {

    //Vars
    @Binding var isDarkMode:Bool
    let entry:JournalItem
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 100)
                .shadow(radius: 5)
                .foregroundColor(Color(.white))
                .cornerRadius(15)
                .padding()
            
            HStack{
                Image(uiImage: entry.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: 10))
                    .frame(maxWidth: 200, maxHeight: 200)
                    .padding(.vertical, 5)
                
                VStack(alignment: .leading){
                    Text(entry.decription)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                        .lineLimit(3)
                        .padding(.horizontal, 5)
                    
                    
                    Spacer()
                    
                    
                    Text(dateFormatter(entry.date))
                        .font(.system(size: 12))
                        .lineLimit(1)
                        .padding(5)
                }
                .foregroundColor(isDarkMode ? Color.black : Color.black)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(isDarkMode ? Color.yellow : Color.yellow)
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
    }
    
    
    func dateFormatter(_ date:Date) -> String {
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "HH:mm E, d MMM y"
        
        return formatter3.string(from: date)
    }
}
