//
//  AppDelegate.swift
//  RSSFeed
//
//  Created by Saiteja Alle on 9/17/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let masterViewController = MasterViewController()
        let masterNavigationController = UINavigationController(rootViewController: masterViewController)
        masterNavigationController.navigationBar.isTranslucent = false
        window.rootViewController = masterNavigationController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}
