//
//  HomeViewController.swift
//  TvShowsApp-CodeChallenge
//
//  Created by Muaz Talha Bulut on 10.04.2022.
//

import UIKit
import Kingfisher


final class HomeViewController: UIViewController {
    var tableView = UITableView()
    
    public var movieList = [Movie]()
    private var favList = [FavoritesMovie]()
   // private let Dictionary = UserDefaults.standard.set(FavoritesMovie.self(), forKey: "Dic")
   
    

    
    func someMethodInWantToCall(cell: UITableViewCell) {
        let tapController = tableView.indexPath(for: cell)
        print(tapController!)
        
    
    }
    
    let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    var requestPage: Int = 1
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        configureTableView()
        getPopularMovies()
    }
    
    
    func getPopularMovies() {
        service.request(route: APIRouter.popular(page: requestPage),
                        result: { [weak self] (result: Result<GetFavoriteMoviesResponse, ServiceError>) in
            guard let self = self else { return }
            switch result {
                case .success(let response):
                    self.requestPage += 1
                    self.movieList.append(contentsOf: response.results)
                    self.reloadTableView()
                case .failure(let error):
                    switch error {
                    case .parse(let desc):
                        print(desc)
                    case .url, .network, .data:
                        print(error)
                }
            }
        })
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.pin(to: view)
        
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseIdentifier)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movieList.count - 6 {
            getPopularMovies()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as! MovieCell
        cell.configure(movie: movieList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController(movie: movieList[indexPath.row])
            self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}



