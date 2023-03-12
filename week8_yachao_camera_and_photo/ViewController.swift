//
//  ViewController.swift
//  week8_yachao_camera_and_photo
//
//  Created by Yachao on 2023-03-12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .secondarySystemBackground
    }

    
    @IBAction func open_photos() {
        PhotoGalleryManager.shared.showActionSheet(vc: self)
        
        
        PhotoGalleryManager.shared.imagePickerBlock = {[weak self] image in
            guard let self = self else{
                return
            }
            self.imageView.image = image
        }
        
    }
    
}

//extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true,completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
//            return
//        }
//        imageView.image = image
//    }
//}
