//
//  ViewController.swift
//  TvShowsApp-CodeChallenge
//
//  Created by Muaz Talha Bulut on 10.04.2022.
//

import Foundation

internal protocol ServiceConfiguration {
    var urlString: String {get}
    var endPoint: String {get}
}

enum HTTPMethod: String {
    case get = "GET"
}

