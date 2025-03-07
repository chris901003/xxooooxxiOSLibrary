// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/23.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOEllipseView: UIView {
    private let shapeLayer = CAShapeLayer()
    private let fillColor: CGColor

    public init(fillColor: UIColor) {
        self.fillColor = fillColor.cgColor
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        layer.addSublayer(shapeLayer)
        shapeLayer.fillColor = fillColor
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(ovalIn: bounds)
        shapeLayer.path = path.cgPath
    }
}
