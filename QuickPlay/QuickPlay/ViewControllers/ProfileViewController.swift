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
    var riotApiKey = apiKey().getApiKey()
    var userArray = [UserModel]()
    var userObject:UserModel? = nil
    
    @IBAction func returnFromSaveProfile(segue:UIStoryboardSegue) {
        if segue.identifier == "NameEdit" {
            
        }
        if segue.identifier == "PictureEdit" {
            
        }
        if segue.identifier == "BioEdit" {
            
        }
        if segue.identifier == "LeagueEdit" {
            
        }
    }
    @IBAction func returnFromCancelProfile(segue:UIStoryboardSegue) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserObject")
        userArray = try! managedObjectContext.fetch(fetch) as! [UserModel]
        if(userArray.count != 0) {
            userObject = userArray[0] // userObject is first item in array
            
        }
    }
}
