import UIKit

final class AppCoordinator {
	private let window: UIWindow
	
	init(window: UIWindow) {
		self.window = window
	}
	
	func start() {
		let viewController = CompassViewController()
		let presenter = CompassPresenter(locationService: LocationService())
		
		viewController.presenter = presenter
		presenter.view = viewController
		
		window.rootViewController = viewController
	}
}
