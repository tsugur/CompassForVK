import CoreLocation

protocol CompassPresenterProtocol {
	func onViewDidLoad()
}

final class CompassPresenter: CompassPresenterProtocol {
	private let locationService: LocationServiceProtocol
	weak var view: CompassViewProtocol?
	
	init(locationService: LocationServiceProtocol) {
		self.locationService = locationService
		
		locationService.onUpdatingHeading = { [weak self] in
			self?.onUpdatingHeading($0)
		}
	}
	
	deinit {
		locationService.stopUpdatingHeading()
	}
	
	func onViewDidLoad() {
		locationService.startUpdatingHeading()
	}
	
	private func onUpdatingHeading(_ locationDirection: CLLocationDirection) {
		let radians = locationDirection * .pi / 180 * -1
		view?.rotateCompass(on: radians)
		let locationDirectionText = locationDirectionText(from: locationDirection) ?? ""
		view?.setDegrees("\(Int(locationDirection).description) ° \(locationDirectionText)")
	}
	
	private func locationDirectionText(from degrees: CGFloat) -> String? {
		switch degrees {
		case 0..<22.5, 337.5...360:
			return "N"
		case 22.5..<67.5:
			return "NE"
		case 67.5..<112.5:
			return "E"
		case 112.5..<157.5:
			return "SE"
		case 157.5..<202.5:
			return "E"
		case 202.5..<247.5:
			return "SW"
		case 247.5..<292.5:
			return "W"
		case 292.5..<337.5:
			return "NW"
		default:
			return nil
		}
	}
}
