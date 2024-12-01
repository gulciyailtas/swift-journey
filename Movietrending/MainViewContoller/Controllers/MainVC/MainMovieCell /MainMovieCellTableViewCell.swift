//
//  MainMovieCellTableViewCell.swift
//
//
//  Created by Gülçiya İltaş on 10.11.2024.
//

import SDWebImage
import UIKit

class MainMovieCellTableViewCell: UITableViewCell {
    static var identifier: String {
        "MainMovieCellTableViewCell"
    }
    
    static func register() -> UINib {
        UINib(nibName: "MainMovieCellTableViewCell", bundle: nil)
    }
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var mavieImageView: UIImageView!
    @IBOutlet var dataLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.round()
        containerView.addBorder(color: .lightGray, width: 1)
        self.mavieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.name
        self.dataLabel.text = viewModel.date
        self.rateLabel.text = viewModel.score
        self.mavieImageView.sd_setImage(with: viewModel.image)
    }
}
  
