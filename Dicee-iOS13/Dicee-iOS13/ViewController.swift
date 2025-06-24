//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Gülçiya İltaş on 8.05.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var diceImageView1: UIImageView!
    @IBOutlet var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceImages = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
            
        let leftDiceNumber = Int.random(in: 0...5)
        let rightDiceNumber = Int.random(in: 0...5)

        diceImageView1.image = UIImage(named: diceImages[leftDiceNumber])
        diceImageView2.image = UIImage(named: diceImages[rightDiceNumber])
    }
}
