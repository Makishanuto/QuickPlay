//
//  MapScreenViewController.swift
//  QuickPlay
//
//  Created by Matthew on 3/30/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import Contacts
import CoreLocation

class MapScreenViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var localSearch: UITextField!
    
    var coords:CLLocationCoordinate2D?
    var cityName:String? = nil
    let mapSpan = MKCoordinateSpanMake(0.1, 0.1)
    var nearestGameStoreCoordinate:CLLocationCoordinate2D?
    var nearestGameStoreName:String?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
    }
    
    
    @IBAction func searchAction(_ sender: Any) {
        
        let geoCoder = CLGeocoder()
        let cityString = localSearch.text!
        geoCoder.geocodeAddressString(cityString, completionHandler:
            {(placemarks, error) in
                if error != nil {
                    print("Geocode failed with error: \(error!.localizedDescription)")
                } else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    let location = placemark.location
                    self.coords = location!.coordinate
                    print(self.coords)
                    print(location)
                    let coordinateRegion = MKCoordinateRegion(center: placemark.location!.coordinate, span: self.self.mapSpan)
                    self.mapView.setRegion(coordinateRegion, animated: true)
                    let cityAnnotation = MKPointAnnotation()
                    cityAnnotation.coordinate = placemark.location!.coordinate
                    cityAnnotation.title = placemark.locality
                    cityAnnotation.subtitle = placemark.subLocality
                    self.mapView.addAnnotation(cityAnnotation)
                    
                }
                let localRequest = MKLocalSearchRequest()
                localRequest.naturalLanguageQuery = "game store"
                localRequest.region = self.mapView.region
                let startSearch = MKLocalSearch(request: localRequest)
                startSearch.start { response, _ in
                    guard let response = response else {
                        return
                    }
                    let matches: [MKMapItem] = response.mapItems
                    for match in matches {
                        let results = MKPointAnnotation()
                        results.coordinate = match.placemark.location!.coordinate
                        results.title = match.name
                        results.subtitle = match.placemark.subLocality
                        self.mapView.addAnnotation(results)
                        self.nearestGameStoreCoordinate = results.coordinate
                        self.nearestGameStoreName = results.title
                        self.saveButton.isEnabled = true;
                    }
                }
        })
        
       
    }
    
}
