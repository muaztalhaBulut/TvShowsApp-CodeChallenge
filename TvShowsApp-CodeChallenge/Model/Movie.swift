//
//  Movies.swift
//  TvShowsApp-CodeChallenge
//
//  Created by Muaz Talha Bulut on 10.04.2022.
//

import Foundation


 struct Movie: Codable {
    var backdrop_path: String?
    var name: String?
    var overview: String?
    
     
     
    
    
    var imageUrl: String {
        return "https://image.tmdb.org/t/p/w500/" + (self.backdrop_path ?? "")
    }
}






