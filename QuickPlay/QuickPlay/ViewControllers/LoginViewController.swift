//
//  LoginViewController.swift
//  QuickPlay
//
//  Created by Matthew Wong on 4/21/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class LoginViewController: UIViewController {
    var handle:AuthStateDidChangeListenerHandle? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func Pleasework(_ sender: Any) {
        let MapScreenViewController = self.storyboard?.instantiateViewController(withIdentifier: "MapScreenViewController") as! MapScreenViewController
        
        self.navigationController?.pushViewController(MapScreenViewController, animated: true)
    }
    
    // Auth
    /*override func viewDidAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            self.present(self.controller, animated: true, completion: nil)
        }
    }
    
 
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    */
}

