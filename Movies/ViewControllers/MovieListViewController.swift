//
//  MovieListViewController.swift
//  Movies
//
//  Created by Ramina Tastanova on 13.11.2024.
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let viewModel = MovieListViewModel()
    private let tableView = UITableView()
    
    enum Constants {
        static let movieCellIdentifier = "MovieCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        viewModel.onMoviesFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.fetchTrendingMovies()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.movieCellIdentifier)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.movieCellIdentifier, for: indexPath)
        let movie = viewModel.movies[indexPath.row]
        cell.textLabel?.text = movie.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        let detailsViewController = MovieDetailsViewController(movieId: movie.imdbId)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}