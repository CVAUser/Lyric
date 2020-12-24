//
//  SearchViewController.swift
//  Lyric
//
//  Created by Slava on 08.12.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    var searchContent: SearchContentView?
    var artistField: String?
    var trackField: String?
    var jsonData: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

//MARK: - Config navigation interface
        
        //Creating the right navigation bar button
        let done = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(selectionComplete))
        self.navigationItem.setRightBarButton(done, animated: true)
        
        //Controller title in nav bar
        self.navigationItem.title = "Search"
        
//MARK: -  Content of search elements
        
        searchContent = SearchContentView()
        if let search = searchContent {
            view.addSubview(search)
            
            //Config layout
            
            //Lets modify the view’s size and location using Auto Layout
            search.translatesAutoresizingMaskIntoConstraints = false
            //Display view that is not covered by navigation bars, tab bars, toolbars, and other ancestor views
            let safeArea = view.safeAreaLayoutGuide
            //Constraints using Auto Layout
            search.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
            safeArea.bottomAnchor.constraint(equalTo: search.bottomAnchor).isActive = true
            search.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            search.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            
            search.artist.delegate = self
            search.track.delegate = self
            search.send.addTarget(self, action: #selector(sendQuery), for: .touchDown)
        }
        

        
    }
    
    //Filling with data internal variables
    //Do not send empty search requests, check fields
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let search = searchContent {
            switch textField {
            case search.artist:
                if textField.text!.isEmpty {
                    artistField = nil
                } else {
                    artistField = textField.text
                }
            case search.track:
                if textField.text!.isEmpty {
                    trackField = nil
                } else {
                   trackField = textField.text
                }
            default:
                print("Default Field")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let search = searchContent {
            switch textField {
            case search.artist:
                search.track.becomeFirstResponder()
            case search.track:
                textField.resignFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
    
    @objc func sendQuery() {
        let url: URL
        if let search = searchContent {
            search.endEditing(true)
        }
        if let artistField = artistField, let trackField = trackField {
            print("Поля заполнены")
            url = Musixmatch.query.makeUrl(method: .lyric, artist: artistField, track: trackField)
            print(url)
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url,
                                completionHandler: { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    serialize(json: data!)
                }
            }).resume()
            
        } else {
            print("Форма поиска Artist должна быть обязательно заполнена")
        }
    }
    
    @objc func selectionComplete() {
        
    }
    

}
