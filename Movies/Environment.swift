//
//  Environment.swift
//  Movies
//
//  Created by Ramina Tastanova on 13.11.2024.
//

import Foundation

public enum Environment {
    enum Keys {
        static let apiKey = "API_KEY"
        static let baseURL = "BASE_URL"
    }
    
    ///Getting plist here
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    ///Get apiKey and baseUrl from plist\
    static let baseURL: String = {
        guard let baseURLString = Environment.infoDictionary[Keys.baseURL] as? String else {
            fatalError("Base URLnot set in plist")
        }
        return baseURLString
    }()
    
    static let apiKey: String = {
        guard let apiKeyString = Environment.infoDictionary[Keys.apiKey] as? String else {
            fatalError("API Key set in plist")
        }
        return apiKeyString
    }()
}
