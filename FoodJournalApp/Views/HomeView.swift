//
//  HomeView.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/21.
//

import SwiftUI

struct HomeView: View {
    
    //Vars
    @State var _journalEntries = Utilities.journalEntries
    @State var isAddFoodItemView:Bool = false
    @State var check:String = "Food description eodjeojfoeofjeofoejfojefoejfoejfojejfooejfooejfojeofejofjoejfjfeofjeof eodjeodjoedoejoejdoedjoejdoeekdokeodoek"
    
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    ForEach(_journalEntries) {
                        EntryModelView(decription: $0.decription, date: $0.date, imageName: $0.imageName)
                    }
                }
                //.content
                
                
                Spacer()
                
                
                ZStack{
                    
                    Rectangle()
                        .frame(width:80, height: 40)
                        .foregroundColor(Color(.systemYellow))
                        .padding(.bottom, 40)
                        .cornerRadius(80)
                        .shadow(color: Color(.systemYellow), radius: 10)
                    
                    
                    Rectangle()
                        .frame(width:80, height: 40)
                        .foregroundColor(Color(.systemYellow))
                        .padding(.top, 40)
                        .cornerRadius(10)
                        .shadow(color: Color(.systemYellow), radius: 10)
                    
                    
                    Button {
                        isAddFoodItemView.toggle()
                        //Camera().takePic()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .background(Color(.systemYellow))
                            .foregroundColor(Color(.black))
                            .cornerRadius(80)
                    }
                }
                
                
                //Navigation Controllers
                NavigationLink(destination: AddEntryView(isAddFoodItemView: $isAddFoodItemView), isActive: $isAddFoodItemView){
                    EmptyView()
                }
            }
            .navigationTitle("My Food Journal")
            //.navigationBarTitleDisplayMode(.inline)
            .onAppear{
                Utilities().popDemoEntries(8)
                
                _journalEntries = Utilities.journalEntries
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
