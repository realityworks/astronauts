//
//  AppDelegate.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let useCaseFactory = UseCaseFactory()
        useCaseFactory.register(
            useCase: AstronautsListUseCase.self,
            instance: AstronautsListUseCase()
        )

        Store.initialise(useCases: useCaseFactory)

        // Override point for customization after application launch.
        let vc = AstronautListViewController()
        let nvc = UINavigationController(rootViewController: vc)

        self.window?.rootViewController = nvc
        self.window?.makeKeyAndVisible()
        return true
    }
}

// MARK: UISceneSession Lifecycle

@available(iOS 13.0, *)
extension AppDelegate {

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
