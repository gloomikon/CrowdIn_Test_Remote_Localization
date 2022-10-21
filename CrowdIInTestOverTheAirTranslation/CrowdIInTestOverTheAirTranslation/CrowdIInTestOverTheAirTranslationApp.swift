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
//    @UISceneDelegate(SceneDelegate.self) var sceneDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let crowdinProviderConfig = CrowdinProviderConfig(
            hashString: "bad86ab525d24c2e345bfd97600",
            sourceLanguage: "en"
        )

        var loginConfig: CrowdinLoginConfig
        do {
            loginConfig = try .init(
                clientId: "8zZi7hz8dkmnDHbGEa8m",
                clientSecret: "J18dJf6LWHslnNKl1JkZC3Gro7nRJvt8yBTTh87N",
                scope: "project"
            )
        } catch {
            fatalError(error.localizedDescription)
        }

        let crowdinSDKConfig = CrowdinSDKConfig.config().with(crowdinProviderConfig: crowdinProviderConfig)
            .with(loginConfig: loginConfig)
            .with(debugEnabled: true)
            .with(settingsEnabled: true)
            .with(screenshotsEnabled: true)
            .with(realtimeUpdatesEnabled: true)

        CrowdinSDK.startWithConfig(crowdinSDKConfig, completion: {
            print("Added successfully")

            NotificationCenter.default.post(name: .init("test"), object: nil)
        })

        CrowdinSDK.setOnLogCallback { logMessage in
            print("LOG MESSAGE - \(logMessage)")
        }

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {

        CrowdinSDK.handle(url: url)
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self // 👈🏻
        return sceneConfig
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        CrowdinSDK.handle(url: url)
    }
}
