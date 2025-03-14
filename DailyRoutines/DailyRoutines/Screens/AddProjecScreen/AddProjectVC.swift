//
//  AddProjectVC.swift
//  DailyRoutines
//
//  Created by Gülçiya İltaş on 10.01.2025.
//

import UIKit

class AddProjectVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var selectTaskPickerButton: UIButton!
    @IBOutlet var selectTaskPickerTitleButton: UILabel!
    @IBOutlet var selectTaskPickerContentButton: UILabel!
    @IBOutlet var projectNameLabel: UILabel!
    @IBOutlet var appNameLabel: UILabel!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var shoppingExplanationLabel: UILabel!
    @IBOutlet var selectDataPickerButton: UIButton!
    @IBOutlet var selectDataPickerStartLabel: UILabel!
    @IBOutlet var selectDataPickerStartHistoryLabel: UILabel!
    @IBOutlet var selectTaskDatePickerButton: UIButton!
    @IBOutlet var SelectEndDateLabel: UILabel!
    @IBOutlet var selectEndHistoryLabel: UILabel!
    
    private let pickerView = UIPickerView()
    private let options = ["Work", "Personal", "Health", "Hobby"]
    private let selectedTask: String? = nil
    private let startDatePicker = UIDatePicker()
    private let endDatePicker = UIPickerView()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Project"
        navigationController?.navigationBar.topItem?.title = ""
        
        prepareNavBarRightImage()
        prepareSelectTaskPickerButton()
        preparebackgroundView()
        prepareShoppingItemLabel()
        prepareSelectDataPickerButton()
        prepareSelectTaskDatePickerButton()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        
    }

    private func prepareNavBarRightImage() {
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
    
    private func prepareSelectTaskPickerButton() {
        selectTaskPickerButton.layer.cornerRadius = 15
        selectTaskPickerButton.clipsToBounds = true
        selectTaskPickerTitleButton.font = UIFont(name: AppFonts.regular.rawValue, size: 9)
        selectTaskPickerTitleButton.text = "Task Group"
        selectTaskPickerContentButton.font = UIFont(name: AppFonts.regular.rawValue, size: 14)
        selectTaskPickerContentButton.text = "Select a Group"
    }
    
    @IBAction func selectTaskDatePicker(_ sender: Any) {
        let alert = UIAlertController(title: "Select Start Date", message: "\n\n\n\n\n\n\n", preferredStyle: .alert)
        
        let startDatePicker = UIPickerView(frame: CGRect(x: 0, y: 10, width: 270, height: 150))
        startDatePicker.delegate = self
        startDatePicker.dataSource = self
        alert.view.addSubview(startDatePicker)
        
        let okAction = UIAlertAction(title: "Seç", style: .default) { _ in
            print("Seçlen Dil: ")
        }
        alert.addAction(okAction)
        alert.addAction(UIAlertAction(title: "İptal", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }

    private func prepareSelectDataPickerButton() {
        selectDataPickerButton.layer.cornerRadius = 15
        selectDataPickerButton.clipsToBounds = true
        selectDataPickerStartLabel.font = UIFont(name: AppFonts.regular.rawValue, size: 9)
        selectDataPickerStartLabel.text = "Star Date"
        selectDataPickerStartHistoryLabel.font = UIFont(name: AppFonts.regular.rawValue, size: 14)
        selectDataPickerStartHistoryLabel.text = "Select a Date"
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
    
    @IBAction func selectTaskEndDataPicker(_ sender: Any) {
        let alert = UIAlertController(title: "Select End Date", message: "\n\n\n\n\n\n\n", preferredStyle: .alert)
        
        let endDatePicker = UIPickerView(frame: CGRect(x: 0, y: 10, width: 270, height: 150))
        endDatePicker.delegate = self
        endDatePicker.dataSource = self
        alert.view.addSubview(endDatePicker)
        
        let okAction = UIAlertAction(title: "Seç", style: .default) { _ in
            print("Seçlen Dil: ")
        }
        alert.addAction(okAction)
        alert.addAction(UIAlertAction(title: "İptal", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    private func prepareSelectTaskDatePickerButton() {
        selectTaskDatePickerButton.layer.cornerRadius = 15
        selectTaskDatePickerButton.clipsToBounds = true
        SelectEndDateLabel.font = UIFont(name: AppFonts.regular.rawValue, size: 9)
        SelectEndDateLabel.text = "End Date"
        selectEndHistoryLabel.font = UIFont(name: AppFonts.regular.rawValue, size: 14)
        selectEndHistoryLabel.text = "Select a Start Date"
    }
    
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
   
