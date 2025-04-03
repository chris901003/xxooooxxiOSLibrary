// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/3/24.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XONavigationBackButtonView: UIView {
    let backIcon = UIImageView()
    let titleLabel = UILabel()

    public init(title: String, image: UIImage? = UIImage(systemName: "chevron.left")) {
        super.init(frame: .zero)
        setup(title, image)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(_ title: String, _ image: UIImage?) {
        backIcon.image = image?.withTintColor(.tintColor, renderingMode: .alwaysOriginal)
        backIcon.contentMode = .scaleAspectFit

        titleLabel.text = title
        titleLabel.textColor = .tintColor
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
    }

    private func layout() {
        addSubview(backIcon)
        backIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            backIcon.topAnchor.constraint(equalTo: topAnchor),
            backIcon.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: backIcon.trailingAnchor, constant: 4),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
