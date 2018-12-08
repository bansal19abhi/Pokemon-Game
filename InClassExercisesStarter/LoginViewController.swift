//
//  LoginViewController.swift
//  InClassExercisesStarter
//
//  Created by Abhishek Bansal on 06/12/18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase


class LoginViewController: UIViewController {
    
    var name = ""
    
    @IBOutlet weak var emailTextbox: UITextField!
    
    @IBOutlet weak var passwordTextbox: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.loginButton(_ <#T##sender: Any##Any#>).layer.cornerRadius = [Your Value]

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
       
        
        print ("User pressed the login button!!")
        
        let email = emailTextbox.text!
        let password = passwordTextbox.text!
        
        Auth.auth().signIn(withEmail: email, password: password) {
            
            (user, error) in
            
            if (user != nil) {
                print("User signed in! ")
                print("User id: \(user?.user.uid)")
                self.name = user?.user.email ?? "unknown"
                print("Email: \(user?.user.email)")
                UserDefaults.standard.set((user?.user.email), forKey: "username")
                self.performSegue(withIdentifier: "segueHome", sender: nil)
                
                
            }
            else {
                print("ERROR!")
                print(error?.localizedDescription)
                self.errorLabel.text = error?.localizedDescription
            }
        }
        
    }
    
    @IBAction func signupButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "segueSignUp", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueHome" {
            let n1 = segue.destination as! SelectPokemonTableViewController
            n1.username = name
            print("name has ben sent to next screen")
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
