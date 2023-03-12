//
//  PhotoGalleryManager.swift
//  week8_yachao_camera_and_photo
//
//  Created by Yachao on 2023-03-12.
//

import Foundation
import UIKit


class PhotoGalleryManager: NSObject {
    
    static let shared = PhotoGalleryManager()
    
    fileprivate var currentVC: UIViewController!
    
    var imagePickerBlock:((UIImage) -> Void)?
    
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            pickerController.allowsEditing = true
            currentVC.present(pickerController,animated: true,completion: nil)
            
        }
    }
    
    private func openPhotoGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            pickerController.allowsEditing = true
            currentVC.present(pickerController,animated: true,completion: nil)
        }
    }
    
    func showActionSheet(vc:UIViewController){
        currentVC = vc
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default,handler: { _ in
            self.openCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default,handler: {[weak self] _ in
            self?.openPhotoGallery()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler:nil))
        
        
        vc.present(actionSheet,animated: true, completion: nil)
        
    }
}


extension PhotoGalleryManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePickerBlock?(image)
        }
        
        currentVC.dismiss(animated: true, completion: nil)
    }
}
