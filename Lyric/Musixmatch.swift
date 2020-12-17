//
//  Musixmatch.swift
//  Lyric
//
//  Created by Slava on 17.12.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import Foundation

//This file is used for example only and is a placeholder Musixmatch API

struct query {
    static let auth: String = "apikey"
    private static let token: String = "6662451acbbf76799b0aa49b5bf236ac"
    static let artist: String = "q_artist"
    static let pageSize: String = "page_size"
    static let page: String = "page"
}
struct Musixmatch {
    static let mimeType: String = "text/plain"
    static let scheme: String = "http"
    static let host: String = "api.musixmatch.com"
    static let path: String = "/ws/1.1/track.search"
    
}
