//
//  MainViewController.swift
//  Movietrending
//
//  Created by Gülçiya İltaş on 9.11.2024.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var viewModel: MainViewModel = .init()
    var moviesDataSource: [MovieTableCellViewModel] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "MainViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
        viewModel.getData()
    }
    
    func configView() {
        title = "Top Trending Movies"
        view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.movies.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies
            else {
                return
            }
            self.moviesDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetails(movieId: Int) {
        guard let movie = viewModel.retriveMovie(withId: movieId) else {
            return
        }
        
        DispatchQueue.main.async {
            let detailsViewModel = DetailsMovieViewModel(movie: movie)
            let controller = DetailsMovieViewController(viewModel: detailsViewModel)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
           
        registerCells()
    }
       
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
       
    func registerCells() {
        tableView.register(MainMovieCellTableViewCell.register(),
                           forCellReuseIdentifier: MainMovieCellTableViewCell.identifier)
    }
       
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCellTableViewCell.identifier, for: indexPath) as? MainMovieCellTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(viewModel: moviesDataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = moviesDataSource[indexPath.row].id
        openDetails(movieId: movieId)
    }
}
