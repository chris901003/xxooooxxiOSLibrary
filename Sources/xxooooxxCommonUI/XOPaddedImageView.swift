// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/3/7.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOPaddedImageView: UIView {
    let insets: UIEdgeInsets
    let imageView = UIImageView()

    public init(padding: UIEdgeInsets, image: UIImage?) {
        self.insets = padding
        self.imageView.image = image
        super.init(frame: .zero)
        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        imageView.contentMode = .scaleAspectFit
    }

    private func layout() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom)
        ])
    }
}
