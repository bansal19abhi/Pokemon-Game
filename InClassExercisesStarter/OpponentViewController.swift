//
//  OpponentViewController.swift
//  InClassExercisesStarter
//
//  Created by Abhishek Bansal on 10/12/18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit
import CoreLocation
import FirebaseFirestore

class OpponentViewController: UIViewController, CLLocationManagerDelegate{
    
    var db:Firestore!
    var rowImage = ""
    @IBOutlet weak var myExp: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var attack1: UILabel!
    @IBOutlet weak var attack2: UILabel!
    @IBOutlet weak var attack3: UILabel!
    @IBOutlet weak var Defence: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    let pokemon = ["Pikachu", "Raichu", "Bulbasaur"]
    let attack = [10,20,30,40]
    let attackName = ["Fire","Shock Wave","Groal"]
    let defence = [10,20,30,40]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        
        
        
        
        
        
        
        
        
        // Static
        var  pikacpu = UserDefaults.standard.string(forKey: "pokName")
        
        var cpupokename = pikacpu as! String
        print(cpupokename)
        
        
        pokemonName.text = cpupokename
        
        
        
        if (cpupokename == "PIKACHU"){
            self.pokemonImage.loadGif(name: "pika")
        }
        
        if (cpupokename == "EEVEE"){
            self.pokemonImage.loadGif(name: "eevee")
        }
        
        if (cpupokename == "BULBASAUR"){
            self.pokemonImage.loadGif(name: "bulbasaur")
        }
        
        if (cpupokename == "CHARMANDER"){
            self.pokemonImage.loadGif(name: "charmander")
        }
        
        if (cpupokename == "SQUIRTLE"){
            self.pokemonImage.loadGif(name: "squirtle")
        }
            /*let chatRef = db.collection("Pokemon Map")
            chatRef.document("CHARMANDER").getData([
                "attack1": self.attack1.text!,
                "attack2": self.attack2.text!,
                "attack3": self.attack3.text!,
                "defence": self.Defence.text!,
                ])
            print("Message sent!")*/
            
            
            
            let resRef = db.collection("Pokemon Map").whereField("Name", isEqualTo: cpupokename)
            print("Querying database")
            resRef.getDocuments() {
                (snapshot, error) in
                
                if (error != nil) {
                    print("Error getting results from query")
                }
                else {
                    print("Got something!")
                    print("Num items in database matching query: \(snapshot!.count)")
                    //print("Name: \(snapsho)")
                    
                    
                    for document in snapshot!.documents {
                        
                        let data = document.data()
                        let attack01 = data["Attack1"] as! Int
                        let attack02 = data["Attack2"] as! Int
                        let attack03 = data["Attack3"] as! Int
                        let defence = data["Defence"] as! Int
                        
                        
                        print("\(document.documentID) => \(attack01)")
                        self.attack1.text! = "\(attack01)"
                        
                        print("\(document.documentID) => \(attack02)")
                        self.attack2.text! = "\(attack02)"
                        
                        print("\(document.documentID) => \(attack03)")
                        self.attack3.text! = "\(attack03)"
                        
                        print("\(document.documentID) => \(defence)")
                        self.Defence.text! = "\(defence)"
                        
                        
                    
                        
                        
                        
                        //print("\(document.documentID) => \(name)")
                        //self.sucessMessage.text! = "\(name)"
        }
                }
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
}
