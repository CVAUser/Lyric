//
//  Musixmatch.swift
//  Lyric
//
//  Created by Slava on 17.12.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import Foundation

//MARK: Musixmatch API

enum Method: String {
    case artist = "artist.search"
    case track = "track.search"
}
struct Musixmatch {
    init() {}
    private let query = Musixmatch()
    
    let mimeType: String = "text/plain"
    let scheme: String = "http"
    let host: String = "api.musixmatch.com"
    var path: String = "/ws/1.1/"
//    static var method: String?
}
