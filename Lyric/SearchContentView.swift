//
//  SearchContentView.swift
//  Lyric
//
//  Created by Slava on 09.12.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import UIKit

class SearchContentView: UIView {
    private let artist = UITextField()
    private let track = UITextField()
    private let send = UIButton.init(type: UIButton.ButtonType.system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
        addSubview(artist)
        addSubview(track)
        addSubview(send)
        
        customizeSearchArtist()
        customizeSeaarchButton()
        customizeSearchTrack()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: Customize search fields
    
    func customizeSearchArtist() {
        artist.translatesAutoresizingMaskIntoConstraints = false
        artist.backgroundColor = UIColor.white
        artist.placeholder = "Search artist"
        artist.borderStyle = .roundedRect
        artist.topAnchor.constraint(equalTo: topAnchor, constant:10).isActive = true
        artist.leftAnchor.constraint(equalTo: leftAnchor, constant:10).isActive = true
        artist.rightAnchor.constraint(equalTo: rightAnchor, constant:-10).isActive = true
    }
    
    func customizeSearchTrack() {
        track.translatesAutoresizingMaskIntoConstraints = false
        track.backgroundColor = UIColor.white
        track.placeholder = "Search track"
        track.borderStyle = .roundedRect
        track.topAnchor.constraint(equalTo: artist.bottomAnchor, constant: 20).isActive = true
        track.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        track.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    func customizeSeaarchButton() {
        send.translatesAutoresizingMaskIntoConstraints = false
        send.setTitle("Search", for: UIControl.State.normal)
        send.backgroundColor = UIColor.white
        send.tintColor = UIColor.black
        send.layer.cornerRadius = 5
        send.clipsToBounds = true
        send.topAnchor.constraint(equalTo: track.bottomAnchor, constant: 30).isActive = true
        send.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        send.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
}
