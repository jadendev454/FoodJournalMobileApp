//
//  AddEntryView.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/23.
//

import SwiftUI

struct AddEntryView: View{
    
    //Vars
    @Binding var isAddFoodItemView:Bool
    @State var entryDecription:String = "Add item description?"

    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    

    var body: some View {
        ZStack(alignment: .topTrailing) {
            

            VStack{
                
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                }
                
                
                VStack(alignment: .leading){
                    Text("Food Description:")
                        .bold()
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                    
                    
                    TextEditor(text: $entryDecription)
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 95, maxHeight: 100)
                        .padding(.leading)
                        .padding(.trailing)
                        .background(Color(.systemGray5))
                        .scrollContentBackground(.hidden)
                        .border(.black)
                        .cornerRadius(10)
                        .padding(.bottom)
                        .font(.system(size: 20))
                        .lineLimit(5)
                    
                }
                .padding()

                 
                Spacer()
 
                
                if #available(iOS 16.0, *) {
                    Button("Add Item") {
                        addItem()
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
                } else {
                    // Fallback on earlier versions
                    Button("Add Item") {
                        addItem()
                    }
                    .frame(minWidth: 300, minHeight: 60)
                    .background(Color(.black).opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(45)
                    .shadow(color: Color(.systemYellow), radius: 10)
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }

            
            Menu {
                Button("Take Photo", action: {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()})
                Button("Choose From Libary", action: {
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
                })
            } label: {
                Image(systemName: "camera.badge.ellipsis")
                    .font(.system(size: 25))
                    .padding(20)
            }
            
        }
        .tint(.blue)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    //Methods
    func addItem() {
        
        if selectedImage != nil{
            Utilities().addEntry(JournalItem(decription: entryDecription, date: Date.now, imageName: selectedImage!))
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isAddFoodItemView.toggle()
                
            }
        }
    }
    
    
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView(isAddFoodItemView: .constant(false))
    }
}
