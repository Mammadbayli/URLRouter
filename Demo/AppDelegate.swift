//
//  AppDelegate.swift
//  Demo
//
//  Created by Javad Mammadbeyli on 2806//2019.
//  Copyright © 2019 Bank Respublika OJSC. All rights reserved.
//

import UIKit
import URLRouter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        
        Router.shared.register(vc: SecondViewController.self, forURL: .secondVC)
        Router.shared.register(vc: ThirdViewController.self, forURL: .thirdVC)
        Router.shared.register(vc: ViewController.self, forURL: .firstVC)
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: UISceneSession Lifecycle


}

