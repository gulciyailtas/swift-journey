//
//  DetailsMovieViewController.swift
//  Movietrending
//
//  Created by Gülçiya İltaş on 12.11.2024.
//

import SDWebImage
import UIKit

class DetailsMovieViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptonLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    var viewModel: DetailsMovieViewModel

    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Details"
        prepareImageView()
        prepareTitleLabel()
        prepareDescriptionLabel()
    }
    
    private func prepareImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.sd_setImage(with: viewModel.movieImage)
    }
    
    private func prepareTitleLabel() {
        titleLabel.text = viewModel.movieTitle
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 24)
    }
    
    private func prepareDescriptionLabel() {
        descriptonLabel.text = viewModel.movieDescription
        descriptonLabel.numberOfLines = 0
        descriptonLabel.textAlignment = .center
        descriptonLabel.textColor = .black
        descriptonLabel.font = .systemFont(ofSize: 20)
    }
}
