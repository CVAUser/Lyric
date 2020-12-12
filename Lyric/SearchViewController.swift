//
//  SearchViewController.swift
//  Lyric
//
//  Created by Slava on 08.12.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //MARK: - Config navigation interface
        
        //Создание правой кнопки навигационного бара
        let done = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(selectionComplete))
        self.navigationItem.setRightBarButton(done, animated: true)
        
        //Заголовок контроллера в навигационном баре
        self.navigationItem.title = "Search"
        
        //MARK: -  Query elements
        
        let searchContent = SearchContentView()
        searchContent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchContent)
        searchContent.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchContent.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchContent.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        
    }
    

    
    @objc func selectionComplete() {
        
    }
    

}
