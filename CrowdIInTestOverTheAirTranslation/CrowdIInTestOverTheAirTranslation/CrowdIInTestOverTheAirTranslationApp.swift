//
//  CrowdIInTestOverTheAirTranslationApp.swift
//  CrowdIInTestOverTheAirTranslation
//
//  Created by Admin on 07.10.2022.
//

import SwiftUI
import CrowdinSDK

@main
struct CrowdIInTestOverTheAirTranslationApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let crowdinProviderConfig = CrowdinProviderConfig(hashString: "e-1103571ae0328b10f3433b34s8",
          sourceLanguage: "en")
        let crowdinSDKConfig = CrowdinSDKConfig.config().with(crowdinProviderConfig: crowdinProviderConfig)
            .with(debugEnabled: true)

        CrowdinSDK.startWithConfig(crowdinSDKConfig, completion: {
            print("Added successfully")
        })

        CrowdinSDK.setOnLogCallback { logMessage in
           print("LOG MESSAGE - \(logMessage)")
        }

        return true
    }

}
