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
    private let searchButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
        addSubview(searchField)
        customizeSearchField()
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func customizeSearchField() {
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.backgroundColor = UIColor.white
        searchField.placeholder = "Search artist or track"
        searchField.borderStyle = .roundedRect
        searchField.topAnchor.constraint(equalTo: topAnchor, constant:10).isActive = true
        searchField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        searchField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
