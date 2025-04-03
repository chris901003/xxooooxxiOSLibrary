// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/4/3.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOExpandingLineView: UIView {
    private let maskLayer = CALayer()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLine()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLine()
    }

    private func setupLine() {
        backgroundColor = .systemGray5
        maskLayer.backgroundColor = UIColor.black.cgColor

        layer.addSublayer(maskLayer)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        if maskLayer.frame.height == 0 {
            maskLayer.frame = .init(x: bounds.midX, y: bounds.midY, width: 0, height: 2)
        }
    }

    public func startAnimation(duration: Double = 0.3) {
        let finalWidth = bounds.width
        let finalFrame = CGRect(x: 0, y: 0, width: finalWidth, height: bounds.height)

        maskLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        maskLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        maskLayer.bounds = CGRect(x: 0, y: 0, width: 0, height: bounds.height)

        let widthAnimation = CABasicAnimation(keyPath: "bounds.size.width")
        widthAnimation.fromValue = 0
        widthAnimation.toValue = finalWidth

        widthAnimation.duration = duration
        widthAnimation.timingFunction = CAMediaTimingFunction(name: .linear)

        maskLayer.bounds.size.width = finalWidth
        maskLayer.add(widthAnimation, forKey: "expand")
    }

    public func retractAnimation(duration: Double = 0.3) {
        let retractAnimation = CABasicAnimation(keyPath: "bounds.size.width")
        retractAnimation.fromValue = bounds.width
        retractAnimation.toValue = 0
        retractAnimation.duration = duration
        retractAnimation.timingFunction = CAMediaTimingFunction(name: .linear)

        maskLayer.bounds.size.width = 0
        maskLayer.add(retractAnimation, forKey: "retract")
    }
}
