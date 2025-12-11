//
//  ViewController.swift
//  CalculatorDemo
//
//  Created by Gülçiya İltaş on 20.11.2025.
//

import UIKit

class ViewController: UIViewController {

    private var count = 0
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "Count: 0"
        label.textAlignment = .center
        label.accessibilityIdentifier = "countLabel"
        return label
    }()
    
    let plusButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        btn.accessibilityIdentifier = "plusButton"
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(countLabel)
        view.addSubview(plusButton)
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            plusButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20)
        ])
        
        plusButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
    }
    
    @objc func increaseCount() {
        count += 1
        countLabel.text = "Count: \(count)"
    }

}

