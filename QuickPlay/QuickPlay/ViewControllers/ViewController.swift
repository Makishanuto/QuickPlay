//
//  ViewController.swift
//  QuickPlay
//
//  Created by Matthew on 3/30/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Contacts

class ViewController: UIViewController, CLLocationManagerDelegate {
    var coordinateAvailable:Bool = false
    var nearestGameStoreCoordinate:CLLocationCoordinate2D? = nil
    var nearestGameStoreName:String? = nil
    var longitudeString:String? = nil
    var latitudeString:String? = nil
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var coordinateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verifyCoordinates()
    }
    func verifyCoordinates() {
        if(coordinateAvailable) {
            longitudeString = "\(nearestGameStoreCoordinate!.longitude)"
            latitudeString = "\(nearestGameStoreCoordinate!.latitude)"
            placeNameLabel.text = nearestGameStoreName!
            coordinateLabel.text = "COORDINATES: [\(longitudeString!), \(latitudeString!)]"
        }
    }
    @IBAction func returnFromSegueSave(segue:UIStoryboardSegue) {
        if let mapSelect = segue.source as? MapScreenViewController {
            coordinateAvailable = true
            nearestGameStoreCoordinate = mapSelect.nearestGameStoreCoordinate
            nearestGameStoreName = mapSelect.nearestGameStoreName
            verifyCoordinates()
        }
    }
    @IBAction func returnFromCancel(segue:UIStoryboardSegue) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

