//
//  NetworkManager.swift
//  Movies
//
//  Created by Ramina Tastanova on 13.11.2024.
//

import Foundation

class NetworkManager {
    // Use Environment struct to fetch the API key and base URL
    private let baseURL = Environment.baseURL
    private let apiKey = Environment.apiKey
    
    func fetchTrendingMovies(completion: @escaping ([Movie]?) -> Void) {
        let urlString = "\(baseURL)/?page=1"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 60.0
        request.setValue(apiKey, forHTTPHeaderField: "X-Rapidapi-Key")
        request.setValue("PostmanRuntime/7.42.0", forHTTPHeaderField: "User-Agent")
        request.setValue("movies-tv-shows-database.p.rapidapi.com", forHTTPHeaderField: "X-Rapidapi-Host")
        request.setValue("get-trending-movies", forHTTPHeaderField: "Type")
        request.cachePolicy = .useProtocolCachePolicy
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            if let string = String(data: data, encoding: .utf8) {
                print(string)
            } else {
                print("Failed to convert Data to String.")
            }
            
            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(response.movieResults)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func fetchMovieDetails(by id: String, completion: @escaping (MovieDetails?) -> Void) {
        let urlString = "\(baseURL)/?movieid=\(id)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("movies-tv-shows-database.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("get-movie-details", forHTTPHeaderField: "Type")
        request.setValue("PostmanRuntime/7.42.0", forHTTPHeaderField: "User-Agent")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(MovieDetails.self, from: data)
                completion(response)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
