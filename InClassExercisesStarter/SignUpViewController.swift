//
//  SignUpViewController.swift
//  InClassExercisesStarter
//
//  Created by Abhishek Bansal on 06/12/18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var userNameTextbox: UITextField!
    
    @IBOutlet weak var emailTextbox: UITextField!
    
    @IBOutlet weak var passwordTextbox: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupButton(_ sender: Any) {
        print ("Signup button pressed")
        let name = userNameTextbox.text!
        let email = emailTextbox.text!
        let password = passwordTextbox.text!
        
        Auth.auth().createUser(withEmail: email, password: password) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. New user created!
                print("-- USER CREATED --")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                self.errorLabel.text = "User Created"
            }
            else {
                print("ERROR!")
                print(error?.localizedDescription)
                self.errorLabel.text = error?.localizedDescription
            }
        }
    }
    
    

}
