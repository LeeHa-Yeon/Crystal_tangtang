//
//  AppDelegate.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/20.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import Firebase


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                return AuthController.handleOpenUrl(url: url)
            }

            return false
        }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        KakaoSDKCommon.initSDK(appKey: "28606e1121ffd1626f732dddb44de4b3")
        FirebaseApp.configure()
        
        // Override point for customization after application launch.
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
            SocketIOManager.shared.establishConnection()
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
            SocketIOManager.shared.closeConnection()
    }


}

