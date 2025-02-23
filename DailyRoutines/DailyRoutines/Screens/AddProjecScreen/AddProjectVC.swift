//
//  AddProjectVC.swift
//  DailyRoutines
//
//  Created by Gülçiya İltaş on 10.01.2025.
//

import UIKit

class AddProjectVC: UIViewController {
    
    @IBOutlet weak var selectTaskPickerButton: UIButton!
    @IBOutlet weak var selectTaskPickerTitleButton: UILabel!
    @IBOutlet weak var selectTaskPickerContentButton: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var shoppingExplanationLabel: UILabel!
    
    
    
    private let pickerView = UIPickerView()
    private let options = ["Java", "Swift", "Kotlin" ,"Pyhton", "C#"]
    private let selectedTask: String? = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Project"
        navigationController?.navigationBar.topItem?.title = ""
        
        prepareNavBarRightImage()
        prepareselectTaskPickerButton()
        
    }
    private func prepareNavBarRightImage(){
        let iconImage = UIImage(named: "notification_icon")
        let rightButton = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
        
    }
    
    @objc private func rightButtonTapped() {
        print("Sağ Butona Tıklandı!")
    }
    
    @IBAction func selectTaskPickerAction(_ sender: Any) {
        let alert = UIAlertController(title: "Select a Group", message: "\n\n\n\n\n\n\n", preferredStyle: .alert)
               
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 10, width: 270, height: 150))
        pickerView.delegate = self
        pickerView.dataSource = self
        alert.view.addSubview(pickerView)

        let okAction = UIAlertAction(title: "Seç", style: .default) { _ in
        print("Seçlen Dil: ")
         }
        alert.addAction(okAction)
        alert.addAction(UIAlertAction(title: "İptal", style: .cancel, handler: nil))
         
         present(alert, animated: true, completion: nil)
     }
 }

    private func prepareselectTaskPickerButton() {
        selectTaskPickerButton.layer.cornerRadius = 15
        selectTaskPickerButton.clipsToBounds = true
        selectTaskPickerTitleButton.font = UIFont(name: AppFonts.regular.rawValue, size: 9)
        selectTaskPickerTitleButton.text = "Task Group"
        selectTaskPickerContentButton.font = UIFont(name: AppFonts.semiBold.rawValue, size: 14)
        selectTaskPickerContentButton.text = "Select a Group"
        
    }
    private func preparebackgroundView() {
    backgroundView?.layer.cornerRadius = 15
    backgroundView?.clipsToBounds = true
    projectNameLabel.font = UIFont(name: AppFonts.regular.rawValue, size: 9)
    projectNameLabel.text = "Project Name"
    appNameLabel.font = UIFont(name: AppFonts.regular.rawValue, size: 14)
    appNameLabel.text = "Grocery Shopping App"
}
    private func prepareShoppingItemLabel() {
        descriptionLabel.font = UIFont(name: AppFonts.regular.rawValue, size: 9)
        descriptionLabel.text = "Description"
        shoppingExplanationLabel.font = UIFont(name: AppFonts.regular.rawValue, size: 11)
        shoppingExplanationLabel.text = "This application is designed for super shops. By using this application they can enlist all their products in one place and dliver. Customers will get a one-stop solution for their daily shopping."
            
}
    extension AddProjectVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
   
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return options.count
   }
   
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return options[row]
   }
   
   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       print("Seçilen dil: \(options[row])")
   }
}
