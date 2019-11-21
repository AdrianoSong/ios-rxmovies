//
//  MovieCell.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 28/10/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {
    
    struct Constants {
        static let cellIdentifier: String = "MovieCell"
    }
    
    fileprivate let container: UIStackView = {
       
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.axis = .horizontal
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    fileprivate let movieImage: UIImageView = {
        
        let view = UIImageView()
        view.image = UIImage(named: "question_mark")?.af_imageScaled(to: CGSize(width: 100, height: 100))
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
       return view
    }()
    
    var moviePosterUrl: String? {
        didSet {
            guard let newMoviePosterString = moviePosterUrl,
                let posterURL = URL(string: newMoviePosterString) else {
                    return
            }
            
            let newMoviewPosterURL = URLRequest(url: posterURL)
            
            MovieApi.requestPosterCachedImage(
                newMoviewPosterURL: newMoviewPosterURL, imageCotainer: movieImage)
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
        selectionStyle = .none
        
        setupContainerStack()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupContainerStack() {
        
        container.addArrangedSubview(movieImage)
        container.addArrangedSubview(movieTitle)
        
        addSubview(container)
        
        container.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        container.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
