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
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var viewContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    //var riotApiKey = apiKey().getApiKey()
    var userArray = [UserModel]()
    var userObject:UserModel? = nil
    
    @IBAction func returnFromSaveProfile(segue:UIStoryboardSegue) {
        if let nameEdit = segue.source as? NameEdit {
            let name = nameEdit.nameTextField.text!
        }
        if let pictureEdit = segue.source as? PictureEdit {
            
        }
        if let bioEdit = segue.source as? BioEdit {
            
        }
        if let leagueEdit = segue.source as? LeagueEdit {
            
        }
    }
    @IBAction func returnFromCancelProfile(segue:UIStoryboardSegue) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
        userArray = try! managedObjectContext.fetch(fetch) as! [UserModel]
        if(userArray.count != 0) {
            userObject = userArray[0] // userObject is first item in array

        }
    }
}
