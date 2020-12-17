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
 //Layout
            search.translatesAutoresizingMaskIntoConstraints = false
            let safeArea = view.safeAreaLayoutGuide
            search.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
            safeArea.bottomAnchor.constraint(equalTo: search.bottomAnchor).isActive = true
            search.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            search.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            
            search.artist.delegate = self
        }
        

        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\(String(describing: textField.text))")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let search = searchContent {
            switch textField {
            case search.artist:
                search.track.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
    @objc func selectionComplete() {
        
    }
    

}
