//
//  ProfileViewController.swift
//  QuickPlay
//
//  Created by Matthew on 3/30/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var viewContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    var riotApiKey = apiKey().getApiKey()
    var userArray = [UserModel]()
    var userObject:UserModel? = nil
    
    @IBAction func returnFromSaveProfile(segue:UIStoryboardSegue) {
        if let nameEdit = segue.source as? NameEdit {
            let name = nameEdit.nameTextField.text!
            userObject?.setValue(name, forKey: "userName")
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
            let results = try! managedObjectContext.fetch(fetch) as! [UserModel]
            results[0].setValue(name, forKey: "userName")

        }
        
        if let pictureEdit = segue.source as? PictureEdit {
            let picture = pictureEdit.profileImage.image!
            userObject?.setValue(UIImagePNGRepresentation(picture), forKey: "userPicture")
        }
        
        if let bioEdit = segue.source as? BioEdit {
            let biography = bioEdit.bioTextField.text!
            userObject?.setValue(biography, forKey: "userDescription")
        }
        
        if let leagueEdit = segue.source as? LeagueEdit {
            //let rank = ... api call here
        }
        reloadUserData()
        do {
            try self.managedObjectContext.save()
        }
        catch {}
    }
    @IBAction func returnFromCancelProfile(segue:UIStoryboardSegue) { }
    
    func reloadUserData() {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
        userArray = try! managedObjectContext.fetch(fetch) as! [UserModel]
        if(userArray.count != 0) {
            userObject = userArray[0] // userObject is first item in array
        }
        nameLabel.text = userObject?.userName!
        bioLabel.text = userObject?.userDescription!
        profileImage.image = UIImage(data:userObject?.userPicture! as! Data)
        //api call rankLabel.text = leagueRank
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
        userArray = try! managedObjectContext.fetch(fetch) as! [UserModel]
        if(userArray.count != 0) {
            userObject = userArray[0] // userObject is first item in array
        }
        else {
            let ent = NSEntityDescription.entity(forEntityName: "UserModel", in: managedObjectContext)
            let userInitialization = UserModel(entity: ent!, insertInto: self.managedObjectContext)
            userInitialization.userName = "Undefined."
            userInitialization.userDescription = "Undefined."
            let holderPic = UIImage(named: "holderPic.png")
            userInitialization.userPicture = UIImagePNGRepresentation(holderPic!)
            do {
                try self.managedObjectContext.save()
            } catch {}
        }
        reloadUserData()
    }
}
