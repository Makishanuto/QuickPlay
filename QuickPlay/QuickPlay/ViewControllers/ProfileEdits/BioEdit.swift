//
//  BioEdit.swift
//  QuickPlay
//
//  Created by Matthew Wong on 4/22/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import UIKit

class BioEdit: UIViewController {
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var bioTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishedEditing(_ sender: Any) {
        view.endEditing(true)
        if bioTextField.text?.isEmpty ?? true {
            continueButton.isEnabled = false
        }
        else {
            continueButton.isEnabled = true
        }
    }
    
}
