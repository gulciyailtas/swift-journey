//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by Gülçiya İltaş on 12.10.2024.
//

import UIKit

class detailsVC: UIViewController {

@IBOutlet weak var imageView: UIImageView!
@IBOutlet weak var nameLabel: UILabel!
@IBOutlet weak var jobLabel: UILabel!
   
    
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
        
        
       
    }
    


}
