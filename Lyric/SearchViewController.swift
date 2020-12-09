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
        view.backgroundColor = UIColor.lightGray
        
        //MARK: - Config navigation interface
        
        //Создание правой кнопки навигационного бара
        let done = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(selectionComplete))
        self.navigationItem.setRightBarButton(done, animated: true)
        
        //Заголовок контроллера в навигационном баре
        self.navigationItem.title = "Search"
        
    }
    

    
    @objc func selectionComplete() {
        
    }
    

}
