//
//  PokeDetailsViewController.swift
//  InClassExercisesStarter
//
//  Created by Abhishek Bansal on 06/12/18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Alamofire
import SwiftyJSON
import CoreLocation
import  MapKit

class PokeDetailsViewController: UIViewController,CLLocationManagerDelegate {
    
    var manager:CLLocationManager!
    var username = ""
    var latitude = 43.669
    var longitude = -79.744
    var l = 0.0001
    //set value of l into user defaults
    var db:Firestore!
    var pokemonName = ""
    var rowImage = ""
    var r = 0
    var bc = ""
    
    @IBOutlet weak var sucessMessage: UILabel!
    
    @IBOutlet weak var hpMessage: UILabel!
    @IBOutlet weak var pokemonDetailLabel: UILabel!
    
    
    @IBOutlet weak var actionMessage: UILabel!
    
    @IBOutlet weak var defenceMessage: UILabel!
    @IBAction func buttonSelectPokemon(_ sender: Any) {
        
        db = Firestore.firestore()
        
        UserData()
    }
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        db = Firestore.firestore()
        if UserDefaults.standard.object(forKey: "lat") != nil
        {
            latitude =  Double(UserDefaults.standard.string(forKey: "lat")!) ?? 43.669
            longitude =  Double(UserDefaults.standard.string(forKey: "lng")!) ?? -79.744
        }
        manager = CLLocationManager()
        manager.delegate = self
        
        // how accurate do you want the lkocation to be?
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        // ask for permission to get the location
        manager.requestAlwaysAuthorization()
        
        // tell the manager to get the person's location
        manager.startUpdatingLocation()
        let ref = db.collection("Pokemon").whereField("name", isEqualTo: self.pokemonName)
        ref.getDocuments() {
            (querySnapshot, err) in
            if (err == nil){
                for document in querySnapshot!.documents {
                   
                    let data = document.data()
                    let name = data["name"] as! String
                    let hp = data["Health Point"] as! Int
                    let defence = data["defence"] as! Int
                    let action = data["action"] as! Int
                    
                    
                    
                    
                    print("\(document.documentID) => \(name)")
                    self.sucessMessage.text! = "\(name)"
                    
                    print("\(document.documentID) => \(hp)")
                    self.hpMessage.text! = "\(hp)"
                    
                    print("\(document.documentID) => \(defence)")
                    self.defenceMessage.text! = "\(defence)"
                    
                    print("\(document.documentID) => \(action)")
                    self.actionMessage.text! = "\(action)"
                    
                    print(self.rowImage)
                    self.pokemonImage.image = UIImage(named: self.rowImage)
                }
            }
            else if let err = err {
                print("this Pokemon is not in database")
                self.sucessMessage.text! = "Error getting documents: \(err)"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("got a new location")
        
        if (locations.count == 0) {
            print("Error getting your location!")
            return
        }
        else {
            print(locations[0])
            let searchRequest = MKLocalSearchRequest()
            latitude = locations[0].coordinate.latitude
            longitude = locations[0].coordinate.longitude
            
        }
        
    }
    
    func  UserData() {
        let user = db.collection("users")
        
        
        latitude = latitude + l
        longitude = longitude - l
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(latitude, forKey: "lat")
        userDefaults.setValue(longitude, forKey: "lng")
        userDefaults.synchronize()
        var n = self.username
        user.document(n).setData([
            "name": self.username,
            "latitude": latitude,
            "longitude": longitude,
            "pokemon": self.pokemonName ?? "Meon",
            "icon": self.rowImage
            ])
    }
    
    

}
