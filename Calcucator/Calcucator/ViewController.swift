//
//  ViewController.swift
//  Calcucator
//
//  Created by Gülçiya İltaş on 14.11.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var vizeText: UITextField!
    @IBOutlet var finalText: UITextField!
    @IBOutlet var noteLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        noteLabel.text = ""
    }
    
    @IBAction func hesapButtonClicked(_ sender: Any) {
        guard let vize = Int(vizeText.text ?? ""), let final = Int(finalText.text ?? "") else {
               noteLabel.text = "Lütfen geçerli bir sayı girin!"
               return
           }
           
           let note = (vize + final) / 2
           
           noteLabel.text = "Ortalama: \(note)"
       }
}
