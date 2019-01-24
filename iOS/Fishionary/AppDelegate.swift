//
//  AppDelegate.swift
//  Fishionary
//
//  Created by Julien on 27/12/15.
//  Copyright © 2015 jeyries. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var flow: AppFlow!

    func applicationDidFinishLaunching(_ application: UIApplication) {
        _ = DataManager.shared
        let navigationController = window?.rootViewController as! UINavigationController
        flow = AppFlow(navigationController: navigationController)
        flow.start()
    }



}

