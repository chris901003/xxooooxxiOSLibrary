// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/4/30.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOBorderLabel: UIView {
    let label = UILabel()
    var padding: UIEdgeInsets

    public init(_ title: String, color: UIColor, padding: UIEdgeInsets) {
        self.padding = padding
        super.init(frame: .zero)
        setup(title, color)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(_ title: String, _ color: UIColor) {
        layer.cornerRadius = 5.0
        layer.borderColor = color.cgColor
        layer.borderWidth = 1.5

        label.text = title
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = color
        label.textAlignment = .center
        label.numberOfLines = 1
    }

    private func layout() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: padding.top),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
        ])
    }
}
