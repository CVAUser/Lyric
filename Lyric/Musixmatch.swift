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
    
    func makeUrl(artist: String, track: String) -> URL {
        var urlParts = self.urlParts
        
        urlParts.path = "/ws/1.1/\(Method.lyric.rawValue)"
        urlParts.queryItems?.append(URLQueryItem.init(name: "q_artist", value: artist))
        urlParts.queryItems?.append(URLQueryItem.init(name: "q_track", value: track))
        
        return urlParts.url!
    }
    
    func makeArtistUrl(artist: String) -> URL {
        var urlParts = self.urlParts
        
        urlParts.path = "/ws/1.1/\(Method.track.rawValue)"
        urlParts.queryItems?.append(URLQueryItem.init(name: "q_artist", value: artist))
        urlParts.queryItems?.append(URLQueryItem.init(name: "page_size", value: "3"))
        urlParts.queryItems?.append(URLQueryItem.init(name: "page", value: "1"))
        
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
struct Body: Codable {
    let lyrics: Lyrics?
    let trackList: [Track]?
}
struct Track: Codable {
    let artistName: String?
    let albumName: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName = "artist_name"
        case albumName = "album_name"
    }
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



func serialize(json: Data) {
    let decoder = JSONDecoder()
    let serialize = try? decoder.decode(JsonMusixmutch.self, from: json)
    print(serialize?.message?.header?.available ?? "Not Found")
}
