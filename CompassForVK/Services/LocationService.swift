import CoreLocation
import Foundation

protocol LocationServiceProtocol: AnyObject {
	var onUpdatingHeading: ((CLLocationDirection) -> ())? { get set }
	
	func startUpdatingHeading()
	func stopUpdatingHeading()
}

final class LocationService: NSObject, CLLocationManagerDelegate, LocationServiceProtocol {
		
	private let locationManager = CLLocationManager()
	
	var onUpdatingHeading: ((CLLocationDirection) -> ())?
	
	override init() {
		super.init()
		
		locationManager.delegate = self
		locationManager.requestWhenInUseAuthorization()
	}
	
	func startUpdatingHeading() {
		locationManager.startUpdatingHeading()
	}
	
	func stopUpdatingHeading() {
		locationManager.stopUpdatingHeading()
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
		onUpdatingHeading?(newHeading.magneticHeading)
	}
}
