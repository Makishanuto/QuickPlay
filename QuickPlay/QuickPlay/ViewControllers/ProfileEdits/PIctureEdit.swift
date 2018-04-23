//
//  PIctureEdit.swift
//  QuickPlay
//
//  Created by Matthew Wong on 4/22/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import UIKit

class PictureEdit:ViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    override func viewDidLoad() {
        imagePick.delegate = self
        super.viewDidLoad()
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    let imagePick = UIImagePickerController()
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        imagePick.dismiss(animated: true, completion: nil)
        profileImage.image=info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    @IBAction func loadImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePick.sourceType = .photoLibrary;
            
            self.present(imagePick, animated: true, completion: nil)
        }
    }
    @IBAction func loadCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePick.sourceType = .camera;
            
            self.present(imagePick, animated: true, completion: nil)
        }
    }
}
