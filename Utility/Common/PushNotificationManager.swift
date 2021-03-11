//
//  PushNotificationManager.swift
//  LeapingFeet
//
//  Created by Magicmind on 12/08/20.
//  Copyright © 2020 Magicmind. All rights reserved.
//

import UIKit
import UserNotifications
import FirebaseMessaging
import FirebaseCore


extension AppDelegate : UNUserNotificationCenterDelegate {

    func setupFirebase(application: UIApplication) {

        FirebaseApp.configure()

        Messaging.messaging().delegate = self

        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            if granted {
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            }
        }
    }

    //MARK:- UNUserNotificationCenterDelegate
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // Called to let your app know which action was selected by the user for a given notification.
        
        let userInfo = response.notification.request.content.userInfo
        self.handleNotification(with: userInfo)
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //Called when a notification is delivered to a foreground app.
        let userInfo = notification.request.content.userInfo
        
        
        // debugPrint full message.
        debugPrint("Push Data -->", userInfo)
        
        /* Change this to your preferred presentation option */
        completionHandler([.sound, .alert, .badge])
    }
    
    ///Handle notification Tap
    func handleNotification(with userInfo: [AnyHashable : Any]) {
        
        
    
    }
}

extension AppDelegate : MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        if let fcmToken = fcmToken, !fcmToken.isEmpty {
            debugPrint("Firebase registration token: \(fcmToken)")
            UserDefaults.standard.set(fcmToken, forKey: UserDefaultsKey.FCMToken)
        }
    }
}



