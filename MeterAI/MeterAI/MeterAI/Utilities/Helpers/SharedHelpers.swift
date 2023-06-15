//
//  SharedHelpers.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 3.06.2023.
//

import Foundation
import OneSignal
import UIKit


struct SharedHelpers {
    
    static func requestPushNotification(){
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            if !accepted  {
                let status: OSDeviceState = OneSignal.getDeviceState()
                let hasPrompted = status.hasNotificationPermission
                if hasPrompted {
                    self.presentAppSettings()
                }
            }
        })
    }
    
    
    static func presentAppSettings() {
        if let url = NSURL(string: UIApplication.openSettingsURLString) as URL? {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
}
