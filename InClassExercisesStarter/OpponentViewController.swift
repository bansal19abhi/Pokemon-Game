//
//  OpponentViewController.swift
//  InClassExercisesStarter
//
//  Created by Abhishek Bansal on 10/12/18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit

class OpponentViewController: UIViewController {
    
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
        
        // Static
        var  pikacpu = UserDefaults.standard.string(forKey: "pokName")
        
        var cpupokename = pikacpu as! String
        print(cpupokename)
        
        
        pokemonName.text = cpupokename
        
        if (cpupokename == "CHARMANDER"){
            print("charmander")
        }
        attack1.text = String(attackName[0])
        attack2.text = String(attackName[1])
        attack3.text = String(attackName[2])
        Defence.text = String(defence[0])
        
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
