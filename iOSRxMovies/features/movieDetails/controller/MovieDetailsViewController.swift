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
        view.numberOfLines = 0
        view.text = "Sample title"
        
        return view
    }()
    
    fileprivate var view2: UIView = {
        
        let view = UIView()
        view.backgroundColor = .blue
        
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
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel?.getMovieTitle()
        view.backgroundColor = .white
        
        setupContainer()
    }
    
    fileprivate func setupContainer() {
        
        container.addArrangedSubview(overview)
        container.addArrangedSubview(view2)
        
        view.addSubview(container)
        
        container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
