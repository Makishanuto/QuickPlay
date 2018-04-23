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
    
    @IBAction func returnFromSave(segue:UIStoryboardSegue) {
        if segue.identifier == "NameEdit" {
            
        }
        if segue.identifier == "PictureEdit" {
            
        }
        if segue.identifier == "BioEdit" {
            
        }
        if segue.identifier == "LeagueEdit" {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
