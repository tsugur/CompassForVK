//
//  AppDelegate.swift
//  CompassForVK
//
//  Created by Tsugur on 10.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var coordinator: AppCoordinator?
	
	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {
		let window = UIWindow(frame: UIScreen.main.bounds)
		coordinator = AppCoordinator(window: window)
		coordinator?.start()
		window.makeKeyAndVisible()
		return true
	}
}

