//
//  SearchContentView.swift
//  Lyric
//
//  Created by Slava on 09.12.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import UIKit

class SearchContentView: UIView {
    private let searchField = UITextField()
    private let searchButton = UIButton.init(type: UIButton.ButtonType.system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
        addSubview(searchField)
        addSubview(searchButton)
        customizeSearchField()
        customizeSeaarchButton()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Customize search fields
    
    func customizeSearchField() {
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.backgroundColor = UIColor.white
        searchField.placeholder = "Search artist or track"
        searchField.borderStyle = .roundedRect
        searchField.topAnchor.constraint(equalTo: topAnchor, constant:10).isActive = true
        searchField.leftAnchor.constraint(equalTo: leftAnchor, constant:10).isActive = true
        searchField.rightAnchor.constraint(equalTo: rightAnchor, constant:-10).isActive = true
    }
    
    func customizeSeaarchButton() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setTitle("Search", for: UIControl.State.normal)
        searchButton.backgroundColor = UIColor.white
        searchButton.tintColor = UIColor.black
        searchButton.layer.cornerRadius = 5
        searchButton.clipsToBounds = true
        searchButton.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 20).isActive = true
        searchButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        searchButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
}
