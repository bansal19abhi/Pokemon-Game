//
//  RunawayViewController.swift
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

class RunawayViewController: UIViewController {
    
     var db:Firestore!
    
    @IBOutlet weak var MyExp: UILabel!
    @IBOutlet weak var Money: UILabel!
    @IBOutlet weak var Health: UILabel!
    
    
    @IBAction func healPokemon(_ sender: Any) {
        print("hospital button pressed")
        print("Get Data pressed!")
        
        
        
        
        
        
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
