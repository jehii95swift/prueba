//
//  AppDelegate.swift
//  Netix
//
//  Created by Jenifer on 8/23/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let oneViewController = OneViewController()
        window?.rootViewController = UINavigationController(rootViewController:  oneViewController)
        window?.makeKeyAndVisible()
        return true
    }
}

