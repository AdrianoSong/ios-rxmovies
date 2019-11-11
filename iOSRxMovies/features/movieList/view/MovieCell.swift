//
//  MovieCell.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 28/10/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    struct Constants {
        static let cellIdentifier: String = "MovieCell"
    }
    
    fileprivate let movieImage: UIImageView = {
        
        let view = UIImageView()
        view.image = UIImage(named: "question_mark")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
       return view
    }()
    
    var moviePoster: UIImage? {
        didSet {
            movieImage.image = moviePoster
        }
    }
    
    fileprivate let movieTitle: UILabel = {
       
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18)
        view.textColor = .black
        view.numberOfLines = 0
        view.text = "Sample title"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var movieTextTitle: String? {
        didSet {
            movieTitle.text = movieTextTitle
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        setupMovieImage()
        setupMovieTitle()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupMovieImage() {
        
        addSubview(movieImage)
        
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    fileprivate func setupMovieTitle() {
        
        addSubview(movieTitle)
        
        movieTitle.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
}
