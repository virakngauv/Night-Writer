//
//  AppDelegate.swift
//  Night Writer
//
//  Created by Virak Ngauv on 1/22/18.
//  Copyright © 2018 Virak Ngauv. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let message = Message()
        message.message = "Hi Hero!"
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(message)
            }
        } catch { print("Error trying to create Realm") }
        
        
        return true
    }




}

