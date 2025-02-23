//
//  LetsStartVC.swift
//  DailyRoutines
//
//  Created by Gülçiya İltaş on 4.01.2025.
//

import UIKit

class LetsStartVC: UIViewController {
    @IBOutlet private var appTitleLabel: UILabel!
    @IBOutlet private var toDoListDescriptionLabel: UILabel!
    @IBOutlet private var letsStartButtonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareAppTitleLabel()
        prepareToDoListDescriptionLabel()
        prepareLetsStartButtonLabel()
    }

    @IBAction func setsStartButtonLabel(_ sender: Any) {
        navigationController?.pushViewController(AddProjectVC(), animated: true)
    }
    
    private func prepareAppTitleLabel() {
        appTitleLabel.font = UIFont(name: AppFonts.semiBold.rawValue, size: 24)
    }

    private func prepareToDoListDescriptionLabel() {
        toDoListDescriptionLabel.font = UIFont(name: AppFonts.regular.rawValue, size: 14)
    }
    
    private func prepareLetsStartButtonLabel() {
        letsStartButtonLabel.font = .init(name: AppFonts.semiBold.rawValue, size: 19)
    }
}
