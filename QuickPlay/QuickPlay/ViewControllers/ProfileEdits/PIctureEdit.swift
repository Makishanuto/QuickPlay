//
//  PIctureEdit.swift
//  QuickPlay
//
//  Created by Matthew Wong on 4/22/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PictureEdit:ViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var viewContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    
    override func viewDidLoad() {
        imagePick.delegate = self
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
        let userArray = try! managedObjectContext.fetch(fetch) as! [UserModel]
        if(userArray.count != 0) {
            profileImage.image = UIImage(data:userArray[0].userPicture! as! Data)
        }
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
