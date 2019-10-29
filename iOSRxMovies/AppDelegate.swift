//
//  AppDelegate.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 28/10/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        byPassMainStoryboard()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        //nothing to do yet
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        //nothing to do yet
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        //nothing to do yet
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //nothing to do yet
    }

    func applicationWillTerminate(_ application: UIApplication) {
        //nothing to do yet
    }
}

// MARK: - Internal functions
extension AppDelegate {
    
    fileprivate func byPassMainStoryboard() {
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let viewController = ViewController()
        
        let navigation = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navigation
    }
}
