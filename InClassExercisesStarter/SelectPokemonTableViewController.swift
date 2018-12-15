//
//  SelectPokemonTableViewController.swift
//  InClassExercisesStarter
//
//  Created by Abhishek Bansal on 06/12/18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation
import MapKit

class SelectPokemonTableViewController: UITableViewController,CLLocationManagerDelegate {
    var manager:CLLocationManager!
    var username = ""
    //    var latitude = 43.6532
    //    var longitude = -79.3832
    //    var l = 0.0001
    //set value of l into user defaults
    var db:Firestore!
    var items = ["Eevee", "Pikachu", "Squirtle","Charmander","Balbasaur"]
    var images = ["eevee","pika","squirtle","charmander","bulbasaur"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        db = Firestore.firestore()
        //        if UserDefaults.standard.object(forKey: "lat") != nil
        //        {
        //            latitude =  Double(UserDefaults.standard.string(forKey: "lat")!) ?? 43.6532
        //            longitude =  Double(UserDefaults.standard.string(forKey: "lng")!) ?? -79.3832
        //        }
        manager = CLLocationManager()
        manager.delegate = self
        
        // how accurate do you want the lkocation to be?
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        // ask for permission to get the location
        manager.requestAlwaysAuthorization()
        
        // tell the manager to get the person's location
        manager.startUpdatingLocation()
        pokemonData()
        
    }
    //
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        print("got a new location")
    //
    //        if (locations.count == 0) {
    //            print("Error getting your location!")
    //            return
    //        }
    //        else {
    //            print(locations[0])
    //            let searchRequest = MKLocalSearchRequest()
    //            latitude = locations[0].coordinate.latitude
    //            longitude = locations[0].coordinate.longitude
    //
    //        }
    //
    //    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let i = indexPath.row
        
        print("Person clicked in row number: \(i)")
        //UserData()
        //
        // if (i != nil) {
        performSegue(withIdentifier: "pokemonDetail", sender: nil)
        // }
        //
        //        else if (i == 1) {
        //            performSegue(withIdentifier: "makeReservation", sender: nil)
        //        }
        //
        //        else if (i == 2) {
        //            performSegue(withIdentifier: "showRest", sender: nil)
        //        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let i = self.tableView.indexPathForSelectedRow?.row
        
        
        print("Selected row: \(i!)")
        let n1 = segue.destination as! PokeDetailsViewController
        n1.pokemonName = items[i!]
        n1.rowImage = images[i!]
        n1.username = self.username
        // n1.r = i ?? 0
        
        print("\(i) row selected as pokemon")
        
        
    }
    
    func pokemonData() {
        let pokemon = db.collection("Pokemon")
        
        pokemon.document("Eevee").setData([
            "name": "Eevee",
            "Health Point": 140,
            "defence": 5,
            "attack1": 20,
            "attack2": 28,
            "attack3": 21
            ])
        pokemon.document("Pikachu").setData([
            "name": "Pikachu",
            "Health Point": 110,
            "defence": 7,
            "attack1": 15,
            "attack2": 24,
            "attack3": 31
            ])
        pokemon.document("Squirtle").setData([
            "name": "Squirtle",
            "Health Point": 100,
            "defence": 6,
            "attack1": 35,
            "attack2": 28,
            "attack3": 11
            ])
        pokemon.document("Charmander").setData([
            "name": "Charmander",
            "Health Point": 110,
            "defence": 9,
            "attack1": 34,
            "attack2": 28,
            "attack3": 24
            
            ])
        pokemon.document("Balbasaur").setData([
            "name": "Balbasaur",
            "Health Point": 80,
            "defence": 10,
            "attack1": 34,
            "attack2": 18,
            "attack3": 23
            ])
    }
    //    func  UserData() {
    //        let user = db.collection("users")
    //        //let pokemon = db.collection("Pokemon").document("Meon")
    //
    //        //        user.document("jenelle@gmail.com").setData([
    //        //            "name": "jenelle@gmail.com",
    //        //            "latitude": 43.6532 ,
    //        //            "longitude": -79.3832,
    //        //            "pokemon": "Meon"
    //        //            ])
    //        latitude = latitude + l
    //        longitude = longitude - l
    //        let userDefaults = UserDefaults.standard
    //        userDefaults.setValue(latitude, forKey: "lat")
    //        userDefaults.setValue(longitude, forKey: "lng")
    //        userDefaults.synchronize()
    //        var n = self.username
    //        user.document(n).setData([
    //            "name": self.username,
    //            "latitude": latitude,
    //            "longitude": longitude,
    //            "pokemon": "Meon"
    //            ])
    //    }
    //
}
