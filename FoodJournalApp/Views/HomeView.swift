//
//  HomeView.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/21.
//

import SwiftUI

struct HomeView: View {
    
    //Vars
    @Binding var isDarkMode:Bool
    @State var _journalEntries = Utilities.journalEntries
    @State var isShowSingleImageView:Bool = false
    @State var isAddFoodItemView:Bool = false
    @State var tappedEntry:JournalItem = JournalItem(decription: "", date: Date.now, imageName: UIImage())
    
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    
                    if !_journalEntries.isEmpty{
                        ForEach(_journalEntries) { _entry in
                            EntryModelView(isDarkMode: $isDarkMode, entry: _entry.self)
                                .onTapGesture {
                                    tappedEntry = _entry.self
                                    
                                    isShowSingleImageView = true
                                }
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
                .padding(.top)
                
                
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
                NavigationLink(destination:                 SingleImageView(isShowSingleImageView: $isShowSingleImageView, entry: tappedEntry), isActive: $isShowSingleImageView){
                    EmptyView()
                }
                
                NavigationLink(destination: AddEntryView(isAddFoodItemView: $isAddFoodItemView), isActive: $isAddFoodItemView){
                    EmptyView()
                }
            }
            .navigationTitle("My Food Journal")
            .onAppear{
                _journalEntries = Utilities.journalEntries
            }
        }
        .toolbar(!isShowSingleImageView ? .visible : .hidden, for: ToolbarPlacement.tabBar)
    }
    
    func loadEntries() {
        _journalEntries = Utilities.journalEntries
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isDarkMode: .constant(false))
    }
}
