//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Gülçiya İltaş on 1.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    var isJames = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    @objc func changePic() {
        if isJames == true {
            imageView.image = UIImage(named: "ahmetkaya2")
            myLabel.text = "Ahmet Kaya"
            isJames = false
        }else {
            imageView.image = UIImage(named: "sezen")
            myLabel.text = "Sezen Aksu"
            isJames = true
        }
    }
}

