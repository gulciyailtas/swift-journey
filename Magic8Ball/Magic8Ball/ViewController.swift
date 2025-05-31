//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Gülçiya İltaş on 14.05.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        
        let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
        
        let ballNumber = Int.random(in: 0...4)
        
        ballImageView.image = UIImage(named: ballArray[ballNumber])
    }
    
}

