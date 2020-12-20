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
    case lyric = "matcher.lyrics.get"
}

struct Musixmatch {
    private init() {}
    static let api = Musixmatch()
    
    var urlParts: URLComponents {
        var urlParts = URLComponents()
        urlParts.scheme = "http"
        urlParts.host = "api.musixmatch.com"
        urlParts.queryItems = Array.init()
        urlParts.queryItems?.append(URLQueryItem.init(name: "apikey", value: "6662451acbbf76799b0aa49b5bf236ac"))
        return urlParts
    }
    
    func makeSearchQueryURL(artist: String, track: String?) -> URL {
        var urlParts = self.urlParts
        urlParts.queryItems?.append(URLQueryItem.init(name: "q_artist", value: artist))
        if let song = track {
            urlParts.path = "/ws/1.1/\(Method.lyric.rawValue)"
            urlParts.queryItems?.append(URLQueryItem.init(name: "q_track", value: song))
        } else {
            urlParts.path = "/ws/1.1/\(Method.artist.rawValue)"
        }
        return urlParts.url!
    }
    
}
