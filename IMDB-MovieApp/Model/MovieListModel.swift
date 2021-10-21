//
//  MovieListModel.swift
//  IMDB-MovieApp
//
//  Created by Gilang Sinawang on 20/10/21.
//

import Foundation

// MARK: - Welcome
struct MovieListWelcome: Codable {
    let items: [MovieListItem]?
    let errorMessage: String?
}

// MARK: - Item
struct MovieListItem: Codable {
    let id, rank, title, fullTitle: String?
    let year: String?
    let image: String?
    let crew, imDbRating, imDbRatingCount: String?
}
