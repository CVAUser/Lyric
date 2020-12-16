//
//  SearchContentView.swift
//  Lyric
//
//  Created by Slava on 09.12.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import UIKit

class SearchContentView: UIView {
    private let searchArtist = UITextField()
    private let searchTrack = UITextField()
    private let searchButton = UIButton.init(type: UIButton.ButtonType.system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
        addSubview(searchArtist)
        addSubview(searchTrack)
        addSubview(searchButton)
        
        customizeSearchArtist()
        customizeSeaarchButton()
        customizeSearchTrack()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Customize search fields
    
    func customizeSearchArtist() {
        searchArtist.translatesAutoresizingMaskIntoConstraints = false
        searchArtist.backgroundColor = UIColor.white
        searchArtist.placeholder = "Search artist"
        searchArtist.borderStyle = .roundedRect
        searchArtist.topAnchor.constraint(equalTo: topAnchor, constant:10).isActive = true
        searchArtist.leftAnchor.constraint(equalTo: leftAnchor, constant:10).isActive = true
        searchArtist.rightAnchor.constraint(equalTo: rightAnchor, constant:-10).isActive = true
    }
    
    func customizeSearchTrack() {
        searchTrack.translatesAutoresizingMaskIntoConstraints = false
        searchTrack.backgroundColor = UIColor.white
        searchTrack.placeholder = "Search track"
        searchTrack.borderStyle = .roundedRect
        searchTrack.topAnchor.constraint(equalTo: searchArtist.bottomAnchor, constant: 20).isActive = true
        searchTrack.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        searchTrack.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    func customizeSeaarchButton() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setTitle("Search", for: UIControl.State.normal)
        searchButton.backgroundColor = UIColor.white
        searchButton.tintColor = UIColor.black
        searchButton.layer.cornerRadius = 5
        searchButton.clipsToBounds = true
        searchButton.topAnchor.constraint(equalTo: searchTrack.bottomAnchor, constant: 30).isActive = true
        searchButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        searchButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
}
