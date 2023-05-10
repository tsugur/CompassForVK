//
//  InnerDiskView.swift
//  CompassForVK
//
//  Created by Tsugur on 10.05.2023.
//

import UIKit

final class InnerDiskView: UIView {
	private let labelN = UILabel()
	private let labelS = UILabel()
	private let labelW = UILabel()
	private let labelE = UILabel()
		
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupSubviews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupSubviews() {
		labelN.text = "N"
		labelS.text = "S"
		labelW.text = "W"
		labelE.text = "E"
		
		labelN.font = .boldSystemFont(ofSize: Spec.fontSize)
		labelS.font = .systemFont(ofSize: Spec.fontSize)
		labelW.font = .systemFont(ofSize: Spec.fontSize)
		labelE.font = .systemFont(ofSize: Spec.fontSize)
		
		addSubview(labelN)
		addSubview(labelS)
		addSubview(labelW)
		addSubview(labelE)
		
		labelN.translatesAutoresizingMaskIntoConstraints = false
		labelS.translatesAutoresizingMaskIntoConstraints = false
		labelW.translatesAutoresizingMaskIntoConstraints = false
		labelE.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			labelN.topAnchor.constraint(equalTo: self.topAnchor, constant: Spec.padding),
			labelN.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			labelS.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Spec.padding),
			labelS.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			labelW.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spec.padding),
			labelW.centerYAnchor.constraint(equalTo: self.centerYAnchor),

			labelE.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spec.padding),
			labelE.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])
	}
}

private enum Spec {
	static let padding: CGFloat = 10
	static let fontSize: CGFloat = 30
}
