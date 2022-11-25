//
//  EntryViewModel.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/22.
//

import Foundation
import SwiftUI


struct EntryModelView: View {

    //Vars
    let entry:JournalItem
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 100)
                .shadow(radius: 5)
                .foregroundColor(Color(.white))
                .padding()
            
            HStack{
                Image(uiImage: entry.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: 10))
                    .frame(maxWidth: 200, maxHeight: 200)
                
                VStack(alignment: .leading){
                    Text(entry.decription)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                        .lineLimit(3)
                        .padding(.horizontal, 5)
                    
                    
                    Spacer()
                    
                    
                    Text(entry.date.description)
                        .font(.system(size: 16))
                        .lineLimit(1)
                        .padding(5)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            //.shadow(radius: 10)
            .padding()
        }
    }
}
