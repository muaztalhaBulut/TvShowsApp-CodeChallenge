//
//  MovieCell.swift
//  TvShowsApp-CodeChallenge
//
//  Created by Muaz Talha Bulut on 10.04.2022.
//

import UIKit

class MovieCell: UITableViewCell {
    var link: HomeViewController?
    var isCouponFav = UserDefaults.standard.bool(forKey: "isCouponFav")
    
    
    private lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    var favoriteButton: UIButton = {
        let favButton = UIButton(type:.system)
        favButton.setImage(UIImage(named: "heart1.png"), for: .normal)
        favButton.tintColor = .red
        favButton.addTarget(self, action: #selector(configureButton), for: .touchUpInside)
        return favButton
    }()
    
    @objc func handleMarkAsFavorite() {
     
     
 }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        contentView.addSubview(movieImageView)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(favoriteButton)
       
        
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    
      
        
        
       
    
      
        }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(movie: Movie) {
        if let url = URL(string: movie.imageUrl) {
            movieImageView.kf.setImage(with: url)
        }
        
        movieTitleLabel.text = movie.name
    
    }
    @objc func configureButton() {
       if isCouponFav {
         let image = UIImage(named: "heart1")
           favoriteButton.setImage(image, for: .normal)
     } else {
         let image = UIImage(named: "heart2")
       favoriteButton.setImage(image, for: .normal)
     }
     isCouponFav = !isCouponFav
     UserDefaults.standard.set(isCouponFav, forKey: "isCouponFav")
     
    }
    
        
    func configureTitleLabel() {
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            movieImageView.widthAnchor.constraint(equalTo: movieImageView.heightAnchor),
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            favoriteButton.leadingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor, constant: 30),
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor)
            
        ])
    }
    
    func setTitleLabelConstraints() {
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieTitleLabel.centerYAnchor.constraint(equalTo: movieImageView.centerYAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20),
            movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.image = nil
    }
    
    
}


