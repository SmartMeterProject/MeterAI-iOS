//
//  AppDelegate.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 25.01.2023.
//

import UIKit
import IQKeyboardManagerSwift
import OneSignal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        handleRegistrations(application: application, launchOptions: launchOptions)
        return true
    }
    
    private func handleRegistrations(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        initializeOneSignal(launchOptions: launchOptions)
    }
    
    private func initializeOneSignal(launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
        OneSignal.initWithLaunchOptions(launchOptions)
        OneSignal.setAppId(Keys.oneSignalAppID)
        //OneSignal.setNotificationOpenedHandler(NotificationButton.notificationOpenedBlock)
        //OneSignal.setNotificationWillShowInForegroundHandler(NotificationButton.notificationWillShowInForegroundBlock)
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

