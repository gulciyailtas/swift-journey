//
//  ViewController.swift
//  myFirstWork
//
//  Created by Gülçiya İltaş on 7.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    // Array of image names
    let images = ["fridakahlo", "bobmarley", "ahmetkaya", "kenny"]
    
    // Array of corresponding names for the images
    let names = ["Frida Kahlo", "Bob Marley", "Ahmet Kaya", "Kenny"]
    
    // Variable to keep track of the current image index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable user interaction on the image view
        imageView.isUserInteractionEnabled = true
        
        imageView.image = UIImage(named: images[currentIndex])
        myLabel.text = ""
        
        // Add tap gesture recognizer to show name
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showName))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        // Add swipe gesture recognizer to change the image
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    // Function to change the picture and clear the label when swiping
    @objc func changePic() {
        // Increment the index to the next image, and loop back if we reach the end
        currentIndex = (currentIndex + 1) % images.count
        
        // Update the image based on the current index
        imageView.image = UIImage(named: images[currentIndex])
        
        // Clear the label whenever the image changes
        myLabel.text = ""
    }
    
    // Function to show the name when tapping on the image
    @objc func showName() {
        // Display the name corresponding to the current image
        myLabel.text = names[currentIndex]
    }
}
