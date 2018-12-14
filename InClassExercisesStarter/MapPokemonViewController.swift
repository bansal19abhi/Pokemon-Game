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
    var db:Firestore!
    
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
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotation is clicked")
        
        print(view.annotation?.title!)
        UserDefaults.standard.set(view.annotation?.title, forKey: "pokName")
        
       // let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "abc")
        // self.navigationController?.pushViewController(vc1!, animated: true)
        
        self.performSegue(withIdentifier: "abc", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        self.mapView.delegate = self
        // EXAMPLE 1: Configuring what is displayed inside the map
        // ------------------------------------------------
        // set the center of the map
        let lat1 = 43.6532
        let long1 = -79.3832
        let x = CLLocationCoordinate2DMake(lat1, long1)
        
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
        pin.title = "PIKACHU"
        let pokemonn = db.collection("Pokemon Map")
        pokemonn.document(pin.title!).setData([
            
            "Name" : pin.title,
            "Lat" : lat1,
            "Long": long1,
            "Attack1" : 50,
            "Attack2" : 30,
            "Attack3" : 45,
            
            "Defence" : 10
            
            ])
        
        // 4. Show the pin on the map
        self.mapView.addAnnotation(pin)
        
        // PRACTICE: Add another pin to the map
        let pin2 = MKPointAnnotation()
        let lat2 = 43.6544
        let long2 = -79.3807
        pin2.coordinate = CLLocationCoordinate2DMake(lat2, long2)
        self.mapView.addAnnotation(pin2)
        pin2.title = "BULBASAUR"
        pokemonn.document(pin2.title!).setData([
            "Name" : pin2.title,
            "Lat" : lat2,
            "Long": long2,
            "Attack1" : 80,
            "Attack2" : 20,
            "Attack3" : 55,
            "Defence" : 7
            ])
        
        let pin3 = MKPointAnnotation()
        let lat3 = 43.6491
        let long3 = -79.3862
        pin3.coordinate = CLLocationCoordinate2DMake(lat3, long3)
        self.mapView.addAnnotation(pin3)
        pin3.title = "EEVEE"
        pokemonn.document(pin3.title!).setData([
            "Name" : pin3.title,
            "Lat" : lat3,
            "Long": long3,
            "Attack1" : 75,
            "Attack2" : 50,
            "Attack3" : 65,
            "Defence" : 0
            ])
        
        
        let pin4 = MKPointAnnotation()
        let lat4 = 43.6536
        let long4 = -79.3778
        pin4.coordinate = CLLocationCoordinate2DMake(lat4, long4)
        self.mapView.addAnnotation(pin4)
        pin4.title = "CHARMANDER"
        pokemonn.document(pin4.title!).setData([
            "Name" : pin4.title,
            "Lat" : lat4,
            "Long": long4,
            "Attack1" : 105,
            "Attack2" : 20,
            "Attack3" : 85,
            "Defence" : 20
            ])
        
        
        let pin5 = MKPointAnnotation()
        let lat5 = 43.6516
        let long5 = -79.3778
        pin5.coordinate = CLLocationCoordinate2DMake(lat5, long5)
        self.mapView.addAnnotation(pin5)
        pin5.title = "SQUIRTLE"
        pokemonn.document(pin5.title!).setData([
            "Name" : pin5.title,
            "Lat" : lat5,
            "Long": long5,
            "Attack1" : 150,
            "Attack2" : 100,
            "Attack3" : 125,
            "Defence" : 50
            ])
        
    }
    
  

}
