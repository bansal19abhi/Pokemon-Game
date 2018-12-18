//
//  FightViewController.swift
//  InClassExercisesStarter
//
//  Created by Abhishek Bansal on 10/12/18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase
import Alamofire
import SwiftyJSON
import CoreLocation
import  MapKit
import ImageIO

class FightViewController: UIViewController {

    @IBOutlet weak var UserAttack1: UILabel!
    @IBOutlet weak var UserAttack2: UILabel!
    @IBOutlet weak var UserAttack3: UILabel!
    @IBOutlet weak var enemyLabel2: UILabel!
    
    @IBOutlet weak var enemyLabel1: UILabel!
    @IBOutlet weak var Result: UILabel!
    
    
    
    @IBOutlet weak var CpuAttack1: UILabel!
    @IBOutlet weak var CpuAttack2: UILabel!
    @IBOutlet weak var CpuAttack3: UILabel!
    
    @IBOutlet weak var CpuAttack: UILabel!
    
    @IBOutlet weak var enemyImage: UIImageView!
    
    @IBOutlet weak var userPokemon: UILabel!
   
    @IBOutlet weak var userLabel2: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    let pokemon = ["Pikachu", "Raichu", "Bulbasor"]
    let attack = [10,20,30,40]
    let attackName = ["Thunder Shock","Thunderbolt","Volt Tackle","Vaporeon","Joleteon","Flareon","Flame Burst","Slash","Flamethrower","Growl","Leech Seed","Vine Whip","Absorb","Acid","Air Slash"]
    let defence = [10,20,30,40]
    
    var progressValue : Float = 1
    
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
    
    
    var cpuattack1Count = 0
    var cpuattack2Count = 0
    var cpuattack3Count = 0
    var cpuhealthPointCount = 0
    var cpudefenceCount = 0
    
    var userattack1Count = 0
    var userattack2Count = 0
    var userattack3Count = 0
    var userhealthPointCount = 0
    var userdefenceCount = 0
    
    var level = 1
    var money = 0
    
    let randomNum:UInt32 = arc4random_uniform(100)
   // var up = userpokemon
    
    @IBOutlet weak var cpuLabelBar: UILabel!
    
    @IBOutlet weak var userLabelBar: UILabel!
    
    
    override func viewDidLoad() {
        print("Loaded the fight screen")
        print("________________________")
        super.viewDidLoad()
        db = Firestore.firestore()
        //let user = db.collection("users").document(Auth.auth().currentUser!.email!).documen
        //UserData()
       // UserDefaults.standard.set(self.pokemonName, forKey: "userpoke")
        
        
        
        
        //______________________ENEMY______________________
        
        var  pikacpu = UserDefaults.standard.string(forKey: "pokName")
        
        var cpupokename = pikacpu as! String
        print(cpupokename)
        
        
        enemyLabel1.text = cpupokename
        
        enemyLabel2.text = cpupokename
        
        if (cpupokename == "PIKACHU"){
            self.enemyImage.image = UIImage(named: "pikachu")
            CpuAttack1.text = String(attackName[0])
            CpuAttack2.text = String(attackName[1])
            CpuAttack3.text = String(attackName[2])
        }
            
        else if (cpupokename == "EEVEE"){
            self.enemyImage.image = UIImage(named: "eevee")
            CpuAttack1.text = String(attackName[3])
            CpuAttack2.text = String(attackName[4])
            CpuAttack3.text = String(attackName[5])
        }
        else if (cpupokename == "CHARMANDER"){
            self.enemyImage.image = UIImage(named: "charmander")
            CpuAttack1.text = String(attackName[6])
            CpuAttack2.text = String(attackName[7])
            CpuAttack3.text = String(attackName[8])
        }
            
        else if (cpupokename == "BULBASAUR"){
            self.enemyImage.image = UIImage(named: "balbasaur")
            CpuAttack1.text = String(attackName[9])
            CpuAttack2.text = String(attackName[10])
            CpuAttack3.text = String(attackName[11])
        }
            
        else if (cpupokename == "SQUIRTLE"){
            self.enemyImage.image = UIImage(named: "squirtle")
            CpuAttack1.text = String(attackName[12])
            CpuAttack2.text = String(attackName[13])
            CpuAttack3.text = String(attackName[14])
        }
        
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
                    let cpuattack01 = data["Attack1"] as! Int
                    let cpuattack02 = data["Attack2"] as! Int
                    let cpuattack03 = data["Attack3"] as! Int
                    let cpudefence = data["Defence"] as! Int
                    let cpuhealthPoint = data["Health Point"] as! Int
                    
                    self.cpuattack1Count = cpuattack01
                    self.cpuattack2Count = cpuattack02
                    self.cpuattack3Count = cpuattack03
                    self.cpuhealthPointCount = cpuhealthPoint
                    self.cpudefenceCount = cpudefence
                    
                    print("_______________________________")
                    print("Displaying the enemy values")
                    print("\(document.documentID) => \(cpuattack01)")
                    print("\(document.documentID) => \(cpuattack02)")
                    print("\(document.documentID) => \(cpuattack03)")
                    print("\(document.documentID) => \(cpudefence)")
                    print("\(document.documentID) => \(cpuhealthPoint)")
                    print("_______________________________")
                    print("Displaying the new stored values")
                    print("attack 1: ", self.cpuattack1Count)
                    print("attack 2: ", self.cpuattack2Count)
                    print("attack 3: ", self.cpuattack3Count)
                    print("health point: ", self.cpuhealthPointCount)
                    print("defence: ", self.cpudefenceCount)
                }
            }
        }
        
        
        
        //______________USER_______________
        var  pikauser = UserDefaults.standard.string(forKey: "userpoke")
        
        var userpokemon = pikauser as! String
        
        
        let ref = db.collection("Pokemon").whereField("name", isEqualTo: userpokemon)
        ref.getDocuments() {
            (querySnapshot, err) in
            if (err == nil){
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let name = data["name"] as! String
                    let userattack01 = data["attack1"] as! Int
                    let userattack02 = data["attack2"] as! Int
                    let userattack03 = data["attack3"] as! Int
                    let userdefence = data["defence"] as! Int
                    let userhealthPoint = data["Health Point"] as! Int
                    
                    self.userattack1Count = userattack01
                    self.userattack2Count = userattack02
                    self.userattack3Count = userattack03
                    self.userhealthPointCount = userhealthPoint
                    self.userdefenceCount = userdefence
                    
                    
                    print("\(document.documentID) => \(name)")
                    self.userPokemon.text! = "\(name)"
                    
                    print("user attack1 : ", self.userattack1Count)
                    print("user attack2 : ", self.userattack2Count)
                    print("user attack3 : ", self.userattack3Count)
                    print("user health point: ", self.userhealthPointCount)
                    print("user defence: ", self.userdefenceCount)
                }}}
        
        
        userLabel2.text = userpokemon
        
        
        if (userpokemon == "Pikachu"){
            self.userImage.image = UIImage(named: "pikachu")
            
        }
            
        else if (userpokemon == "Eevee"){
            self.userImage.image = UIImage(named: "eevee")
            
        }
        else if (userpokemon == "Charmander"){
            self.userImage.image = UIImage(named: "charmander")
            
        }
            
        else if (userpokemon == "Balbasaur"){
            self.userImage.image = UIImage(named: "balbasaur")
            
        }
            
        else if (userpokemon == "Squirtle"){
            self.userImage.image = UIImage(named: "squirtle")
            
        }
        
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func Attack1(_ sender: Any) {
       
        
        print("Attack 1 button is pressed")
        
        if (userhealthPointCount <= 0){
            let message = "Your Health Point is 0. Click on Hospital to gain your Health."
            let infoAlert = UIAlertController(title: "Attack Failed!", message: message, preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)
            Result.text = "YOU LOST"
        }
        else{
        var ab = (cpuhealthPointCount - userattack1Count) + cpudefenceCount
        self.cpuhealthPointCount = ab
        print("CPU health: " , ab)
            cpuLabelBar.text = String(ab)
            enemyfight()
        }
        
        
        
        
        /*
        if (progressValue <= 0.0){
            
            print("less than zero")
            Result.text="You won"
            print(progressValue)
            
        }else if (progressValue == 1){
            
            progressValue -= 0.25
            userHealth.progress = progressValue
            print(progressValue)
            print("is equal to one")
            
        }
            
        else
            
        {
            print(progressValue)
            print("dont know what value it is ")
            
        }*/
    }
    
    
    
    @IBAction func Attack2(_ sender: Any) {
        
        print("Attack 2 button is pressed")
        
        if (userhealthPointCount <= 0 ){
            let message = "Your Health Point is 0. Click on Hospital to gain your Health."
            let infoAlert = UIAlertController(title: "Attack Failed!", message: message, preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)
            Result.text = "YOU LOST"
        }
        else{
            var ab = (cpuhealthPointCount - userattack2Count) + cpudefenceCount
            self.cpuhealthPointCount = ab
            print("CPU health: " , ab)
            cpuLabelBar.text = String(ab)
           
            
            
            
            
            
            enemyfight()
        }
    }
    
    @IBAction func Attack3(_ sender: Any) {
        
        print("Attack 3 button is pressed")
        
        
       
        
        if ( userhealthPointCount <= 0){
            let message = "Your Health Point is 0. Click on Hospital to gain your Health."
            let infoAlert = UIAlertController(title: "Attack Failed!", message: message, preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)
            Result.text = "YOU LOST"
        }
        else{
            var ab = (cpuhealthPointCount - userattack3Count) + cpudefenceCount
            self.cpuhealthPointCount = ab
            print("CPU health: " , ab)
            cpuLabelBar.text = String(ab)
            enemyfight()
        }
    }
    
    
    func enemyfight() {
        
        if (cpuhealthPointCount <= 0){
            
            
            var  pikauser = UserDefaults.standard.string(forKey: "userpoke")
            
            var up = pikauser as! String
            /*let message = "Enemy's Health Point is 0"
            let infoAlert = UIAlertController(title: "Congratulations.YOU WON", message: message, preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)*/
            Result.text = "YOU WON"
            level = level + 1
            var n = up
            
            let ref = db.collection("Pokemon").whereField("name", isEqualTo: n)
            ref.getDocuments() {
                (querySnapshot, err) in
                if (err == nil){
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let money = data["money"] as! Int
            
                    }
                }
            }
            
            
            print("Money before:",self.money)
            money = money + Int(randomNum)
            if (money >= 200)
            {
                money = money - 60
            }
            
            let user = db.collection("Pokemon").document(n).updateData([
                "level" : level,
                "money" : money
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Level Updated",self.level)
                    print("Money Now",self.money)
                    
                }
            }
            self.performSegue(withIdentifier: "congo", sender: nil)
            
            
        }
        
        else{
        
        
        var xz = (userhealthPointCount - cpuattack1Count) + userdefenceCount
        self.userhealthPointCount = xz
            userLabelBar.text = String(xz)
        print("user health: " , xz)
            
            
            
            
            let alert = UIAlertController(title: "Your Attack", message: "Attacking Enemy. Please wait...", preferredStyle: .alert)
            
            alert.view.tintColor = UIColor.black
            let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10,y: 5,width: 50, height: 50)) as UIActivityIndicatorView
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            loadingIndicator.startAnimating();
            
            alert.view.addSubview(loadingIndicator)
            
            self.present(alert, animated: true) {
                self.dismiss(animated: true, completion: {
                    let message = "Enemy has done his turn. It's your time to attack."
                    let alert2 = UIAlertController(title: "Attack", message: message, preferredStyle: UIAlertControllerStyle.alert)
                    alert2.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert2, animated: true, completion: nil)
                })
            }
            
        }
    }
    
    @IBAction func runAwayButton(_ sender: Any) {
    
        self.performSegue(withIdentifier: "xyz", sender: nil)
    
    }
    
    
    func  UserData() {
        //let user = db.collection("users").document(Auth.auth().currentUser!.email!)
        
        
        //latitude = latitude + l
        //longitude = longitude - l
        let userDefaults = UserDefaults.standard
        
       //print(user.pokemon)
    }
    
    
    @IBAction func hospitalButton(_ sender: Any) {
        
        print("Hospital button pressed")
        
        if (userhealthPointCount <= 0){
            let message = "Your Health Point is 0. Hence you are in Hospital."
            let infoAlert = UIAlertController(title: "You can gain HP in Hospital!", message: message, preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)
            Result.text = "Yout are in Hospital now."
        }
        else{
            var ab = (cpuhealthPointCount - userattack1Count) + cpudefenceCount
            self.cpuhealthPointCount = ab
            print("CPU health: " , ab)
            cpuLabelBar.text = String(ab)
            enemyfight()
        }
    
    }
    
    
    
    
    
    

}
