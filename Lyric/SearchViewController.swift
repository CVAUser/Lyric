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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

//MARK: - Config navigation interface
        
        //Создание правой кнопки навигационного бара
        let done = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(selectionComplete))
        self.navigationItem.setRightBarButton(done, animated: true)
        
        //Заголовок контроллера в навигационном баре
        self.navigationItem.title = "Search"
        
//MARK: -  Content of search elements
        
        searchContent = SearchContentView()
        if let search = searchContent {
            view.addSubview(search)
            
            //Configuring layout
            
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
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let search = searchContent {
            switch textField {
            case search.artist:
                artistField = textField.text
            case search.track:
                trackField = textField.text
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
        searchContent?.endEditing(true)
        print("\(String(describing: artistField))")
        print("\(String(describing: trackField))")
    }
    
    @objc func selectionComplete() {
        
    }
    

}
