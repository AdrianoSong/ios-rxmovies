//
//  ViewController.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 28/10/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: MovieListViewModel?
    
    let tableView: UITableView = {
       
        let view = UITableView()
        view.backgroundColor = .white
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var myMoviesArray: Movie = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        
        setupViewModel()
    }
    
    fileprivate func layout() {
        
        controllerStyle()
        
        setupTableView()
    }
    
    fileprivate func setupViewModel() {
        viewModel = MovieListViewModel(delegate: self)
        
        let movieElement = MovieElement(title: "Default cell example")
        
        myMoviesArray.append(movieElement)
    }
    
    fileprivate func controllerStyle() {
        
        title = "Movies RX"
        view.backgroundColor = .white
    }
    
    fileprivate func setupTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.Constants.cellIdentifier)
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
}

// MARK: - tableview functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMoviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            MovieCell.Constants.cellIdentifier, for:
            indexPath) as? MovieCell else {
                return UITableViewCell()
        }
        
        cell.movieTextTitle = myMoviesArray[indexPath.row].title
        cell.moviePosterUrl = myMoviesArray[indexPath.row].coverUrl

        return cell
    }
}

// MARK: - Movie delegate
extension ViewController: MovieListViewModelDelegate {
    func fetchedMovies(movies: Movie) {
        
        myMoviesArray = movies
        tableView.reloadData()
    }
}
