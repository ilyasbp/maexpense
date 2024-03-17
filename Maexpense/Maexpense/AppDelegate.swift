//
//  AppDelegate.swift
//  Maexpense
//
//  Created by Ilyas Bintang Prayogi on 17/03/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let nc = UINavigationController(rootViewController: ExpenseWireframe.init().viewController)
        nc.setNavigationBarHidden(true, animated: false)
        window.rootViewController = nc
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

