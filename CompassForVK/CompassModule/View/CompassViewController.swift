//
//  CompassViewController.swift
//  CompassForVK
//
//  Created by Tsugur on 09.05.2023.
//

import UIKit

protocol CompassViewProtocol: AnyObject {
	func rotateCompass(on radians: CGFloat)
	func setDegrees(_ degrees: String)
}

final class CompassViewController: UIViewController, CompassViewProtocol {
	
	private let compassFaceView = CompassFaceView()
	private let degreesLabel = UILabel()
	private var sideConstraints: [NSLayoutConstraint] = []
	
	var presenter: CompassPresenterProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		presenter?.onViewDidLoad()
		view.addSubview(compassFaceView)
		view.addSubview(degreesLabel)
		
		degreesLabel.font = .systemFont(ofSize: Spec.degreesLabelFontSize)
		setCompassFaceLayout()
		setDegreesLabelLayout()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		let sideValue = view.bounds.width - Spec.padding * 2
		sideConstraints.forEach { constraint in
			constraint.constant = sideValue
		}
	}
	
	private func setCompassFaceLayout() {
		compassFaceView.translatesAutoresizingMaskIntoConstraints = false
		
		let widthConstraint = compassFaceView.widthAnchor.constraint(equalToConstant: .zero)
		let heightConstraint = compassFaceView.heightAnchor.constraint(equalToConstant: .zero)
		
		sideConstraints.append(contentsOf: [widthConstraint, heightConstraint])
		
		NSLayoutConstraint.activate([
			compassFaceView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			compassFaceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			widthConstraint,
			heightConstraint,
		])
	}
	
	private func setDegreesLabelLayout() {
		degreesLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			degreesLabel.topAnchor.constraint(equalTo: compassFaceView.bottomAnchor, constant: Spec.degreesLabelTopOffset),
			degreesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
	
	func rotateCompass(on radians: CGFloat) {
		compassFaceView.transform = CGAffineTransform(rotationAngle: radians)
	}
	
	func setDegrees(_ degrees: String) {
		degreesLabel.text = degrees
	}
}

private enum Spec {
	static let padding: CGFloat = 20
	static let degreesLabelTopOffset: CGFloat = 30
	static let degreesLabelFontSize: CGFloat = 30
}
