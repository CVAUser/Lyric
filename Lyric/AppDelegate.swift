//
//  AppDelegate.swift
//  Lyric
//
//  Created by Slava on 30.11.2020.
//  Copyright © 2020 Slava. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var navigationController: NavigationViewController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        //Привязка опционала для проверки значения
        if let window = self.window {
            navigationController = NavigationViewController(rootViewController: LyricViewController())
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        return true
    }

}

