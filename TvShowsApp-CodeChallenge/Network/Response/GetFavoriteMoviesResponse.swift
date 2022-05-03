//
//  GetFavoriteMoviesResponse.swift
//  TvShowsApp-CodeChallenge
//
//  Created by Muaz Talha Bulut on 11.04.2022.
//

import Foundation
struct GetFavoriteMoviesResponse: Decodable {
    let results: [Movie]
    
}
