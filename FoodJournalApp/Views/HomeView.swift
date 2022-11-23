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
    @State var isAddFoodItemView:Bool = false {
        didSet{
            loadEntries()
        }
    }
    @State var check:String = "Food description eodjeojfoeofjeofoejfojefoejfoejfojejfooejfooejfojeofejofjoejfjfeofjeof eodjeodjoedoejoejdoedjoejdoeekdokeodoek"
    
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    
                    if !_journalEntries.isEmpty{
                        ForEach(_journalEntries) {
                            EntryModelView(decription: $0.decription, date: $0.date, imageName: $0.imageName)
                        }
                    }
                    else{
                        Text("\'Its very empty in here...\'")
                            .font(.system(size: 40))
                            .foregroundColor(Color(.systemGray))
                            .padding(.horizontal)
                            .padding(.top, 100)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        Text("Why not add something?")
                            .font(.system(size: 20))
                            .foregroundColor(Color(.systemGray))
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .italic()
                            .multilineTextAlignment(.center)
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
                
                /*
                //Navigation Controllers
                NavigationLink(destination: AddEntryView(isAddFoodItemView: $isAddFoodItemView), isActive: $isAddFoodItemView){
                    EmptyView()
                }
                 */
            }
            .popover(isPresented: $isAddFoodItemView, content: {
                AddEntryView(isAddFoodItemView: $isAddFoodItemView)
            })
            .navigationTitle("My Food Journal")
            //.navigationBarTitleDisplayMode(.inline)
            .onAppear{
                Utilities().popDemoEntries(8)
                
                _journalEntries = Utilities.journalEntries
            }
        }
    }
    
    func loadEntries() {
        _journalEntries = Utilities.journalEntries
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
