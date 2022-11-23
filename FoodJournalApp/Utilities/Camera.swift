//
//  Camera.swift
//  FoodJournalApp
//
//  Created by IACD 05 on 2022/11/22.
//

import Foundation
import SwiftUI
import UIKit



struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    // Connecting the Coordinator class with this struct
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}



class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
    
}



/*
 class Camera: UIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
 
 static var currentPic:UIImage! {
 didSet{
 imageLoadedCheck = true
 AddEntryView(isAddFoodItemView: .constant(true)).imageEntry = Camera.currentPic
 }
 }
 static var imageLoadedCheck:Bool = false
 
 
 func takePic() {
 let picker = UIImagePickerController()
 picker.sourceType = .camera
 picker.allowsEditing = true
 picker.delegate = self
 //present(picker, animated: true)
 }
 
 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
 
 Camera.currentPic? = info[UIImagePickerController.InfoKey.editedImage] as? UIImage ?? UIImage()
 
 picker.dismiss(animated: true)
 }
 }
 */
