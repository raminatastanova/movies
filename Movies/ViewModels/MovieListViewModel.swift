//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Ramina Tastanova on 13.11.2024.
//

import Foundation
class MovieListViewModel {
    private let apiClient = NetworkManager()
    var movies: [Movie] = []
    var movieDetails: MovieDetails?
    var onMoviesFetched: (() -> Void)?
    var onMovieDetailsFetched: (() -> Void)?
    
    // Fetch trending movies
    func fetchTrendingMovies() {
        apiClient.fetchTrendingMovies { [weak self] movies in
            guard let self = self else { return }
            self.movies = movies ?? []
            self.onMoviesFetched?()
        }
    }
    
    // Fetch movie details
    func fetchMovieDetails(by id: String) {
        apiClient.fetchMovieDetails(by: id) { [weak self] details in
            guard let self = self else { return }
            self.movieDetails = details
            self.onMovieDetailsFetched?()
        }
    }
    
    func searchMovies(query: String) {
        apiClient.searchMovies(query: query) { [weak self] movies in
            guard let self = self else { return }
            self.movies = movies ?? []
            self.onMoviesFetched?()
        }
    }
}
