//
//  Musixmatch.swift
//  Lyric
//
//  Created by Slava on 17.12.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import Foundation

//This file is used for example only and is a placeholder Musixmatch API

private struct Query {
    var auth: URLQueryItem?
    var token: String = "6662451acbbf76799b0aa49b5bf236ac"
    var artist: String = "q_artist"
    var pageSize: String = "page_size"
    var page: String = "page"
}
struct Musixmatch {
    static let mimeType: String = "text/plain"
    static let scheme: String = "http"
    static let host: String = "api.musixmatch.com"
    static let path: String = "/ws/1.1/"
    static var method: String?
}
