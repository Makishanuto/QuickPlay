//
//  AddViewController.swift
//  QuickPlay
//
//  Created by Matthew Wong on 4/22/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import UIKit

class AddViewController:UIViewController {
    @IBOutlet weak var gameNameInput: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var gameDescriptionInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.isEnabled = false
    }
    
    
    @IBAction func finishedEditing(_ sender: Any) {
        if gameNameInput.text?.isEmpty ?? true || gameDescriptionInput.text?.isEmpty ?? true {
            continueButton.isEnabled = false
        }
        else {
            continueButton.isEnabled = true
        }
    }
}
