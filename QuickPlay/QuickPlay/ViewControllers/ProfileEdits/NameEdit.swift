//
//  NameEdit.swift
//  QuickPlay
//
//  Created by Matthew Wong on 4/22/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import UIKit

class NameEdit: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishedEditing(_ sender: Any) {
        if nameTextField.text?.isEmpty ?? true {
            continueButton.isEnabled = false
        }
        else {
            continueButton.isEnabled = true
        }
    }
    
}
