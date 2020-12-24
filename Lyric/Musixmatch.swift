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
    static let query = Musixmatch()
    var json: Message?
    
    private var urlParts: URLComponents {
        var urlParts = URLComponents()
        urlParts.scheme = "http"
        urlParts.host = "api.musixmatch.com"
        urlParts.queryItems = []
        urlParts.queryItems?.append(URLQueryItem.init(name: "apikey", value: "6662451acbbf76799b0aa49b5bf236ac"))
        return urlParts
    }
    
    func makeUrl(method: Method, artist: String, track: String) -> URL {
        var urlParts = self.urlParts
        
        urlParts.path = "/ws/1.1/\(method.rawValue)"
        urlParts.queryItems?.append(URLQueryItem.init(name: "q_artist", value: artist))
        urlParts.queryItems?.append(URLQueryItem.init(name: "q_track", value: track))
        
        return urlParts.url!
    }    
}

struct JsonMusixmutch: Codable {
    let message: Message?
}
struct Message: Codable {
    let body: Body?
    let header: Header?
}
struct Body: Codable {
    let lyrics: Lyrics?
}
struct Lyrics: Codable {
    let pixelTrackingUrl: String?
    let lyricsId: Int?
    let lyricsBody: String?
    let lyricsCopyright: String?
    
    enum CodingKeys: String, CodingKey {
        case pixelTrackingUrl = "pixel_tracking_url"
        case lyricsId = "lyrics_id"
        case lyricsBody = "lyrics_body"
        case lyricsCopyright = "lyrics_copyright"
    }
}
struct Header: Codable {
    let executeTime: Float?
    let statusCode: Int?
    let available: Int?
    
    enum CodingKeys: String, CodingKey {
        case executeTime = "execute_time"
        case statusCode = "status_code"
        case available
    }
}

func serialize(json: Data) {
    let decoder = JSONDecoder()
    let serialize = try? decoder.decode(JsonMusixmutch.self, from: json)
    print(serialize?.message?.header?.available ?? "Not Found")
}
