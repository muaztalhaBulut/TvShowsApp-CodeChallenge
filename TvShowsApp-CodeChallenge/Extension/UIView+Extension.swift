//
//  UIViewExtension.swift
//  TvShowsApp-CodeChallenge
//
//  Created by Muaz Talha Bulut on 10.04.2022.
//

import Foundation
import UIKit

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints                                    = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive                  = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive          = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive        = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive            = true
    }
}
