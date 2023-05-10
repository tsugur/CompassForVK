//
//  CompassFaceView.swift
//  CompassForVK
//
//  Created by Tsugur on 09.05.2023.
//

import UIKit

final class CompassFaceView: UIView {
	private var lines = [UIView]()
	private let diskView = InnerDiskView()
		
	var lineHeight: CGFloat = 30 { didSet { updateCircleLayout() } }
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		for (index, line) in lines.enumerated() {
			line.bounds.size = CGSize(width: 3, height: bounds.width)
			line.center = CGPoint(x: bounds.midX, y: bounds.midY)
			line.transform = CGAffineTransform(rotationAngle: .pi/6 * Double(index))
		}
		
		updateCircleLayout()
	}
	
	private func configure() {
		for i in 1...6 {
			let line = UIView()
			line.backgroundColor = i == 1 ? .red : .label
			
			lines.append(line)
			addSubview(line)
		}
		
		diskView.backgroundColor = .systemBackground
		addSubview(diskView)
		
	}
	
	private func updateCircleLayout() {
		diskView.frame.size = CGSize(
			width: bounds.width - lineHeight,
			height: bounds.height - lineHeight
		)
		diskView.layer.cornerRadius = diskView.bounds.height / 2
		diskView.center = CGPoint(x: bounds.midX, y: bounds.midY)
	}
	
}
