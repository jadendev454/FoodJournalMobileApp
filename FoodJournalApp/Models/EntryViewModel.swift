//
//  EntryViewModel.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/22.
//

import Foundation
import SwiftUI


struct EntryModelView: View {
    
    let decription:String
    let date:Date
    let imageName:UIImage?
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 100)
                .shadow(radius: 5)
                .foregroundColor(Color(.white))
                .padding()
            
            HStack{
                Image(uiImage: imageName!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: 10))
                
                VStack(alignment: .leading){
                    Text(decription)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                        .lineLimit(3)
                        .padding(.horizontal, 5)
                    
                    
                    Spacer()
                    
                    
                    Text(date.description)
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
