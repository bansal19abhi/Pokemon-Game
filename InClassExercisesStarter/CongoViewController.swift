//
//  CongoViewController.swift
//  InClassExercisesStarter
//
//  Created by Abhishek Bansal on 16/12/18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class CongoViewController: UIViewController {

    @IBOutlet weak var imageCongo: UIImageView!
    
    @IBAction func level2(_ sender: Any) {
    }
    
    @IBAction func mainMenu(_ sender: Any) {
        print("Go to main menu pressed")
        self.performSegue(withIdentifier: "mainmenu", sender: nil)
    }
    
    @IBAction func logOut(_ sender: Any) {
        print("Logout button pressed")
        
        
        
       
    }
    
    
    override func viewDidLoad() {
        print("Loaded the congratulations screen")
        super.viewDidLoad()
        self.imageCongo.loadGif(name: "congro")

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
