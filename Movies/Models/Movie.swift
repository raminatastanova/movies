//
//  Movie.swift
//  Movies
//
//  Created by Ramina Tastanova on 13.11.2024.
//

import Foundation
// Movie model for trending movies
struct MovieResponse: Codable {
    let movieResults: [Movie]
    let results: Int?
    let totalResults: String?
    let status: String?
    let statusMessage: String?
    
    private enum CodingKeys: String, CodingKey {
        case movieResults = "movie_results"
        case results, totalResults = "Total_results", status, statusMessage = "status_message"
    }
}
struct Movie: Codable {
    let title: String
    let year: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey {
        case title, year
        case imdbId = "imdb_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        
        if let yearString = try? container.decode(String.self, forKey: .year) {
            self.year = yearString
        } else if let yearNumber = try? container.decode(Int.self, forKey: .year) {
            self.year = String(yearNumber)
        } else {
            self.year = "Unknown"
        }
        
        self.imdbId = try container.decode(String.self, forKey: .imdbId)
    }
}
struct MovieDetails: Codable {
    let title: String
    let description: String?
    let tagline: String?
    let year: String
    let releaseDate: String?
    let imdbId: String
    let imdbRating: String?
    let voteCount: String?
    let popularity: String?
    let youtubeTrailerKey: String?
    let rated: String?
    let runtime: Int?
    let genres: [String]?
    let stars: [String]?
    let directors: [String]?
    let countries: [String]?
    let language: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case title, description, tagline, year
        case releaseDate = "release_date"
        case imdbId = "imdb_id"
        case imdbRating = "imdb_rating"
        case voteCount = "vote_count"
        case popularity, youtubeTrailerKey = "youtube_trailer_key"
        case rated, runtime, genres, stars, directors, countries, language
    }
}
