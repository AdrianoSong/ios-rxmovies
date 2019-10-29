//
//  MovieCell.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 28/10/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    fileprivate let movieImage: UIImageView = {
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
       return view
    }()
    
    fileprivate let movieTitle: UILabel = {
       
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = .black
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
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupMovieImage() {
        
        
        
    }
}
