//
//  MovieDetailsViewController.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 20/11/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    
    var viewModel: MovieDetailsViewModel?
    
    fileprivate var overview: UILabel = {
       
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18)
        view.textColor = .black
        view.textAlignment = .center
        view.sizeToFit()
        view.numberOfLines = 0
        view.text = "Sample title"
        
        return view
    }()
    
    fileprivate var posterImage: UIImageView = {
        
        let view = UIImageView()
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    fileprivate var container: UIStackView = {
       
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .center
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    convenience init() {
        self.init(viewModel: nil)
    }
    
    init(viewModel: MovieDetailsViewModel?) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        
        view.backgroundColor = .white
        
        setupContainer()
    }
    
    fileprivate func layout() {
        
        title = viewModel?.getMovieTitle()
        
        overview.text = viewModel?.getMovieOverview()
        
        viewModel?.setImagePoster(imageContainer: posterImage)
    }
    
    fileprivate func setupContainer() {
        
        container.addArrangedSubview(posterImage)
        container.addArrangedSubview(overview)
        
        view.addSubview(container)
        
        container.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        container.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        container.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
