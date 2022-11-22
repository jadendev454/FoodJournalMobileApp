//
//  JournalListView.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/21.
//

import SwiftUI

struct JournalListView: View {
    
    //Vars
    @Binding var isAddFoodItemView:Bool

    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        //.sheet(isPresented: <#T##Binding<Bool>#>, content: <#T##() -> View#>)
    }
}

struct JournalListView_Previews: PreviewProvider {
    static var previews: some View {
        JournalListView(isAddFoodItemView: .constant(false))
    }
}
