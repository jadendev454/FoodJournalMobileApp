//
//  SingleImageView.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/23.
//

import SwiftUI
import UIKit

struct SingleImageView: View {
    
    //Vars
    @Binding var isShowSingleImageView:Bool
    let entry:JournalItem
   /* let formatter3 = {
        let formatter3 = DateFormatter()
        return formatter3.dateFormat = "HH:mm E, d MMM y"
    }
    */
    var body: some View {
        VStack{
            Image(uiImage: entry.imageName)
                .resizable()
                .scaledToFit()
                .border(.black)
                .padding()
            
            HStack{
                Text(entry.decription)
                    .font(.system(size: 20))
                    .padding()
                
                Spacer()
            }
            
            
            HStack {
                Text(dateFormatter())
                    .font(.system(size: 14))
                    .padding()
                    .fontWeight(.semibold)
                
                Spacer()
            }
            

            Spacer()
            
            if #available(iOS 16.0, *) {
                Button("Done") {
                    withAnimation {
                        isShowSingleImageView.toggle()
                    }
                }
                .frame(minWidth: 300, minHeight: 60)
                .background(Color(.black).opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(45)
                .shadow(color: Color(.systemYellow), radius: 10)
                .font(.system(size: 20))
                .tracking(1)
                .padding(.bottom, 10)
                .padding(.horizontal)
                
                Button("Remove") {
                    withAnimation {
                        deleteCell()
                        isShowSingleImageView.toggle()
                    }
                }
                .frame(minWidth: 300, minHeight: 60)
                .background(Color(.black).opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(45)
                .shadow(color: Color(.systemRed), radius: 10)
                .font(.system(size: 20))
                .tracking(1)
                .padding(.bottom, 10)
                .padding(.horizontal)
            } else {
                // Fallback on earlier versions
                Button("Done") {
                    withAnimation {
                        isShowSingleImageView.toggle()
                    }
                }
                .frame(minWidth: 300, minHeight: 60)
                .background(Color(.black).opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(45)
                .shadow(color: Color(.systemYellow), radius: 10)
                .font(.system(size: 20))
                //.tracking(1)
                .padding(.bottom, 10)
                .padding(.horizontal)
                
                Button("Remove") {
                    withAnimation {
                        deleteCell()
                        isShowSingleImageView.toggle()
                    }
                }
                .frame(minWidth: 300, minHeight: 60)
                .background(Color(.black).opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(45)
                .shadow(color: Color(.systemRed), radius: 10)
                .font(.system(size: 20))
                .tracking(1)
                .padding(.bottom, 10)
                .padding(.horizontal)
            }
        }
        .onAppear{
            print(entry.decription)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    //Methods
    func dateFormatter() -> String {
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "HH:mm E, d MMM y"
        
        return formatter3.string(from: entry.date)
    }
    
    
    func deleteCell(){
        let _index = Utilities.journalEntries.firstIndex(where: {$0 == entry.self}) ?? -1
        
        if _index != -1{
            Utilities.journalEntries.remove(at: _index)
        }
    }
}

struct SingleImageView_Previews: PreviewProvider {
    static var previews: some View {
        SingleImageView(isShowSingleImageView: .constant(false), entry: JournalItem(decription: "nil", date: Date.now, imageName: UIImage()))
    }
}
