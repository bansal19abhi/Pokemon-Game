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
    }
    
    @IBAction func zoomoutButton(_ sender: Any) {
        
        print("zoom out pressed")
        
        var r = mapView.region
        
        print("Current zoom: \(r.span.latitudeDelta)")
        
        r.span.latitudeDelta = r.span.latitudeDelta * 2
        r.span.longitudeDelta = r.span.longitudeDelta * 2
        print("New zoom: \(r.span.latitudeDelta)")
        print("-------")
        
    }
    
    
    @IBAction func hospitalButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // EXAMPLE 1: Configuring what is displayed inside the map
        // ------------------------------------------------
        // set the center of the map
        let x = CLLocationCoordinate2DMake(43.6532, -79.3832)
        
        // pick a zoom level
        let y = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        // set the region property of the mapview
        let z = MKCoordinateRegion(center: x, span: y)
        self.mapView.setRegion(z, animated: true)
        
        
        // EXAMPLE 2:  Add a pin to the map
        // ------------------------------------------------
        
        // 1. Create a pin object
        let pin = MKPointAnnotation()
        
        // 2. Set the latitude / longitude of the pin
        pin.coordinate = x
        
        // 3. OPTIONAL: add a information popup (a "bubble")
        pin.title = "HERE IS SOME INFORMATION"
        
        // 4. Show the pin on the map
        self.mapView.addAnnotation(pin)
        
        // PRACTICE: Add another pin to the map
        let pin2 = MKPointAnnotation()
        pin2.coordinate = CLLocationCoordinate2DMake(43.6544, -79.3807)
        self.mapView.addAnnotation(pin2)
        
        // EXAMPLE 3:  Add a line to the map
        // ------------------------------------------------
        
        // 1. Create the coordinates for your line
        // 2. Put these coordinates in an array
        // 3. Create an MKPolyline object
        mapView.delegate = self
        
        // cn tower
        let pos1 = CLLocationCoordinate2DMake(43.6426, -79.3871)
        // lambton in toronto
        let pos2 = CLLocationCoordinate2DMake(43.773738, -79.335531)
        
        var locations = [pos1, pos2]
        
   //     let polyline = MKPolyline(coordinates: &locations, count: locations.count)
        
 //       mapView.addOverlay(polyline)
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
