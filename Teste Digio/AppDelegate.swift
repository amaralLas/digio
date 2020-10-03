//
//  AppDelegate.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 02/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
      var coordinator: CoordinatorProtocol?
      var window: UIWindow?
      
      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          // Override point for customization after application launch.
          let navController = UINavigationController()

         // send that into our coordinator so that it can display view controllers
         coordinator = AppCoordinator(navigation: navController)

         // tell the coordinator to take over control
         coordinator?.start()
          
          // create a basic UIWindow and activate it
          window = UIWindow(frame: UIScreen.main.bounds)
          window?.rootViewController = navController
          window?.makeKeyAndVisible()
          return true
    }

}

