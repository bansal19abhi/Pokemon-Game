//
//  MapPokemonViewController.swift
//  InClassExercisesStarter
//
//  Created by Abhishek Bansal on 08/12/18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit
import CoreLocation
import FirebaseFirestore

class MapPokemonViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func zoominButton(_ sender: Any) {
        
        print("zoom in pressed")
        
        var r = mapView.region
        
        print("Current zoom: \(r.span.latitudeDelta)")
        
        r.span.latitudeDelta = r.span.latitudeDelta / 3
        r.span.longitudeDelta = r.span.longitudeDelta / 3
        print("New zoom: \(r.span.latitudeDelta)")
        print("________________")
        self.mapView.setRegion(r, animated: true)
    }
    
    @IBAction func zoomoutButton(_ sender: Any) {
        
        print("zoom out pressed")
        
        var r = mapView.region
        
        print("Current zoom: \(r.span.latitudeDelta)")
        
        r.span.latitudeDelta = r.span.latitudeDelta * 2
        r.span.longitudeDelta = r.span.longitudeDelta * 2
        print("New zoom: \(r.span.latitudeDelta)")
        print("-------")
        self.mapView.setRegion(r, animated: true)
    }
    
    
    @IBAction func hospitalButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
