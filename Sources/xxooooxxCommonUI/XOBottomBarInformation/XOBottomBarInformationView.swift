// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/21.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit
import xxooooxxCommonFunction

public enum XOBottomBarInformationType {
    case info, success, failed

    func getBackgroundColor() -> UIColor {
        switch self {
            case .info:
                return UIColor(hexCode: "FEE2E2")
            case .success:
                return UIColor(hexCode: "D1FAE5")
            case .failed:
                return UIColor(hexCode: "FEF3C7")
        }
    }

    func getTextColor() -> UIColor {
        switch self {
            case .info:
                return UIColor(hexCode: "B91C1C")
            case .success:
                return UIColor(hexCode: "047857")
            case .failed:
                return UIColor(hexCode: "D97706")
        }
    }
}

public class XOBottomBarInformationView: UIView {
    let type: XOBottomBarInformationType

    let contentView = UIView()
    let labelView = UILabel()
    let closeButton = UIImageView()

    public init(_ type: XOBottomBarInformationType, info: String) {
        self.type = type
        super.init(frame: .zero)
        setup(info)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(_ info: String) {
        contentView.backgroundColor = type.getBackgroundColor()
        contentView.layer.cornerRadius = 15.0

        labelView.textColor = type.getTextColor()
        labelView.text = info

        closeButton.image = UIImage(systemName: "xmark")?.withTintColor(type.getTextColor(), renderingMode: .alwaysOriginal)
        closeButton.contentMode = .scaleAspectFit
        closeButton.isUserInteractionEnabled = true
        closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeAction)))
    }

    private func layout() {
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        contentView.addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            labelView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            labelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            labelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])

        contentView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            closeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    @objc public func closeAction() {
        self.removeFromSuperview()
    }
}
