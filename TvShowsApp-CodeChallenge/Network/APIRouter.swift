//
//  APIRouter.swift
//  TvShowsApp-CodeChallenge
//
//  Created by Muaz Talha Bulut on 10.04.2022.
//

import Foundation


enum APIRouter: ServiceConfiguration {
    
    case popular(page: Int)
    private static let apiKey = "ce810ce32c636f8458a8dfeb7ac09631"
    
    private static let baseUrl: String =  "https://api.themoviedb.org/3"
    
    var urlString: String {
        switch self {
            case .popular(let pageId):
                return APIRouter.baseUrl + self.endPoint + "?api_key=\(APIRouter.apiKey)&language=en-US&page=\(pageId)"
        }
    }
    
    var endPoint: String {
        switch self {
            case .popular:
                return "/tv/popular"
        }
    }
}




