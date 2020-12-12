//
//  LyricViewController.swift
//  Lyric
//
//  Created by Slava on 08.12.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import UIKit

class LyricViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        self.navigationItem.title = "Lyric List"
        
        //MARK: - Config navigation interface
        
        let addLyric = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(searchLyric))
        self.navigationItem.setRightBarButton(addLyric, animated: true)
    }

    @objc func searchLyric() {
        let searchViewController = SearchViewController()
        if let naviVC = self.navigationController {
            naviVC.pushViewController(searchViewController, animated: true)
        }

    }
}
