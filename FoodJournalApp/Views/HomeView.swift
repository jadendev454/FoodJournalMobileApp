//
//  HomeView.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/21.
//

import SwiftUI

struct HomeView: View {
    
    //Vars
    @State var isAddFoodItemView:Bool = false
    @State var check:String = "Food description eodjeojfoeofjeofoejfojefoejfoejfojejfooejfooejfojeofejofjoejfjfeofjeof eodjeodjoedoejoejdoedjoejdoeekdokeodoek"
    
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    HStack{
                        Image("placeholder_Image")
                            //.frame(width: 100, height: 100, alignment: .center)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .font(.system(size: 10))
                        
                        VStack(alignment: .leading){
                            Text("Food description eodjeojfoeofjeofoejfojefoejfoejfojejfooejfooejfojeofejofjoejfjfeofjeof eodjeodjoedoejoejdoedjoejdoeekdokeodoek")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .font(.system(size: 16))
                                .lineLimit(3)
                                .padding(.horizontal, 5)

                            
                            Spacer()
                            
                            
                            Text("Nov 14, 2022")
                                .font(.system(size: 16))
                                .lineLimit(1)
                                .padding(5)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .padding()
                }
                .content
                
                
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
                NavigationLink(destination: JournalListView(isAddFoodItemView: $isAddFoodItemView), isActive: $isAddFoodItemView){
                    EmptyView()
                }
            }
            .navigationTitle("My Food Journal")
            //.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
