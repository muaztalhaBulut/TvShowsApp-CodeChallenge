//
//  UITableView+Extensions.swift
//  TvShowsApp-CodeChallenge
//
//  Created by Muaz Talha Bulut on 12.04.2022.
//

import UIKit

public protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: ReuseIdentifiable {

    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
