//
//  DetailViewController.swift
//  TvShowsApp-CodeChallenge
//
//  Created by Muaz Talha Bulut on 12.04.2022.
//

import UIKit
import Kingfisher

 class DetailViewController: UIViewController {
    
     let movieList: Movie?
     
   
   
     
    
     init(movie: Movie?) {
         self.movieList = movie
         super.init(nibName: nil, bundle: nil)
     }
 
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
  
  
     
  //  private lazy var FavoriteButton: UIButton = {
  //      let button = UIButton(type: .system)
  //      button.setTitle("Get Favorite", for: .normal)
  //      button.tintColor = .black
  //      button.backgroundColor = .systemBlue
  //      button.layer.cornerRadius = 15
  //      button.addTarget(self, action: #selector(getFavorite), for: .touchUpInside)
  //      return button
  //  }()

    override func loadView() {
        super.loadView()
       
       
       
        
        view.addSubview(movieImageView)
        view.addSubview(movieTitleLabel)
    
       
        configureImageView()
        
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            movieImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            movieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            movieTitleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 30),
            movieTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            movieTitleLabel.heightAnchor.constraint(equalToConstant: 50)
          //  FavoriteButton.heightAnchor.constraint(equalToConstant: 50),
          //  FavoriteButton.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor),
          //  FavoriteButton.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor),
          //  FavoriteButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 15)
            
        //   OverviewLabel.heightAnchor.constraint(equalTo: movieTitleLabel.heightAnchor),
        //   OverviewLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 10),
        //   OverviewLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor),
        //   OverviewLabel.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor)
            
        ])
        func configureImageView() {
            movieImageView.layer.cornerRadius = 10
            movieImageView.clipsToBounds      = true
            
        }
        }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .white
      
        
        
        
    }
  
 //   @objc func getFavorite(sender: UIButton) {
 //       sender.setTitle("remove from favorites", for: UIControl.State.normal)
 //  }
     
  func configure() {
      if let movieName = movieList?.name {
          movieTitleLabel.text = movieName
      }
      if let movieImage = movieList?.imageUrl {
          let url = URL(string: "\(movieImage)")
          movieImageView.kf.setImage(with: url)
      }
    
  }
 }


     


