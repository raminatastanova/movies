//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Ramina Tastanova on 13.11.2024.
//

//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Ramina Tastanova on 13.11.2024.
//

import UIKit
import SnapKit

class MovieDetailsViewController: UIViewController {
    private let viewModel = MovieListViewModel()
    private let movieId: String
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let taglineLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let imdbRatingLabel = UILabel()
    private let voteCountLabel = UILabel()
    private let popularityLabel = UILabel()
    private let runtimeLabel = UILabel()
    private let genresLabel = UILabel()
    private let directorLabel = UILabel()
    private let imdbLinkButton = UIButton(type: .system)
    
    enum Constants {
        static let titleFont = UIFont.boldSystemFont(ofSize: 24)
        static let subtitleFont = UIFont.italicSystemFont(ofSize: 18)
        static let textFont = UIFont.systemFont(ofSize: 16)
        static let imdbButtonTitle = "View on IMDb"
        
        static let noGenres = "No genres"
        static let noDirectors = "No directors"
        static let unknown = "Unknown"
        static let imdbUrlPrefix = "https://www.imdb.com/title/"
        
        static let genresText = "Genres: "
        static let directorsText = "Directors: "
        static let releaseDateText = "Release Date: "
        static let imdbRatingText = "IMDb Rating: "
        static let voteCountText = "Vote Count: "
        static let popularityText = "Popularity: "
        static let runtimeText = "Runtime: "
        
        static let defaultSpacing: CGFloat = 10
        static let topOffset: CGFloat = 20
        static let sideOffset: CGFloat = 20
    }
    
    init(movieId: String) {
        self.movieId = movieId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.fetchMovieDetails(by: movieId)
        viewModel.onMovieDetailsFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        [titleLabel, taglineLabel, descriptionLabel, genresLabel, directorLabel,
         releaseDateLabel, imdbRatingLabel, voteCountLabel, popularityLabel,
         runtimeLabel, imdbLinkButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        titleLabel.font = Constants.titleFont
        taglineLabel.font = Constants.subtitleFont
        taglineLabel.numberOfLines = 0
        taglineLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = Constants.textFont
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        genresLabel.font = Constants.textFont
        genresLabel.numberOfLines = 0
        genresLabel.lineBreakMode = .byWordWrapping
        directorLabel.font = Constants.textFont
        directorLabel.numberOfLines = 0
        directorLabel.lineBreakMode = .byWordWrapping
        releaseDateLabel.font = Constants.textFont
        imdbRatingLabel.font = Constants.textFont
        voteCountLabel.font = Constants.textFont
        popularityLabel.font = Constants.textFont
        runtimeLabel.font = Constants.textFont
        
        imdbLinkButton.setTitleColor(.systemBlue, for: .normal)
        imdbLinkButton.titleLabel?.font = Constants.textFont
        imdbLinkButton.setTitle(Constants.imdbButtonTitle, for: .normal)
        imdbLinkButton.addTarget(self, action: #selector(openIMDbLink), for: .touchUpInside)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constants.topOffset)
            make.left.equalTo(view).offset(Constants.sideOffset)
            make.right.equalTo(view).offset(-Constants.sideOffset)
        }
        
        taglineLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(taglineLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
        
        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
        
        directorLabel.snp.makeConstraints { make in
            make.top.equalTo(genresLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(directorLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
        
        imdbRatingLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseDateLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
        
        voteCountLabel.snp.makeConstraints { make in
            make.top.equalTo(imdbRatingLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
        
        popularityLabel.snp.makeConstraints { make in
            make.top.equalTo(voteCountLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
        
        runtimeLabel.snp.makeConstraints { make in
            make.top.equalTo(popularityLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
        
        imdbLinkButton.snp.makeConstraints { make in
            make.top.equalTo(runtimeLabel.snp.bottom).offset(Constants.defaultSpacing)
            make.left.right.equalTo(titleLabel)
        }
    }
    
    private func updateUI() {
        guard let details = viewModel.movieDetails else { return }
        titleLabel.text = details.title
        taglineLabel.text = details.tagline
        descriptionLabel.text = details.description
        genresLabel.text = Constants.genresText + (details.genres?.joined(separator: ", ") ?? Constants.noGenres)
        directorLabel.text = Constants.directorsText + (details.directors?.joined(separator: ", ") ?? Constants.noDirectors)
        releaseDateLabel.text = Constants.releaseDateText + (details.releaseDate ?? Constants.unknown)
        imdbRatingLabel.text = Constants.imdbRatingText + (details.imdbRating != nil ? String(details.imdbRating!) : "N/A")
        voteCountLabel.text = Constants.voteCountText + (details.voteCount != nil ? String(details.voteCount!) : "N/A")
        popularityLabel.text = Constants.popularityText + (details.popularity != nil ? String(details.popularity!) : "N/A")
        runtimeLabel.text = Constants.runtimeText + (details.runtime != nil ? "\(details.runtime!) mins" : "N/A")
    }
    
    @objc private func openIMDbLink() {
        guard let imdbID = viewModel.movieDetails?.imdbId else { return }
        if let url = URL(string: Constants.imdbUrlPrefix + imdbID) {
            UIApplication.shared.open(url)
        }
    }
}
