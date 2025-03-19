// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/3/19.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOAnimatedPieChartView: UIView {
    public var data: [(value: CGFloat, color: UIColor)] = [] {
        didSet { createPieChart() }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        createPieChart()
    }

    private func createFanPath(startAngle: CGFloat, endAngle: CGFloat) -> UIBezierPath {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.close()
        return path
    }

    private func createPieChart() {
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        if data.isEmpty { return }

        var startAngle: CGFloat = -CGFloat.pi / 2
        let total = data.reduce(0) { $0 + $1.value }
        var delay: CFTimeInterval = 0

        for segment in data {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = createFanPath(startAngle: startAngle, endAngle: startAngle).cgPath
            shapeLayer.fillColor = segment.color.cgColor
            shapeLayer.strokeColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = 0
            layer.addSublayer(shapeLayer)

            let endAngle = startAngle + (segment.value / total) * 2 * .pi

            let fromPath = createFanPath(startAngle: startAngle, endAngle: startAngle).cgPath
            let endPath = createFanPath(startAngle: startAngle, endAngle: endAngle).cgPath
            let animation = CABasicAnimation(keyPath: "path")
            animation.fromValue = fromPath
            animation.toValue = endPath
            animation.duration = 0.3
            animation.beginTime = CACurrentMediaTime() + delay
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false

            shapeLayer.add(animation, forKey: "fanAnimation")

            startAngle = endAngle
            delay += 0.1
        }
    }
}
