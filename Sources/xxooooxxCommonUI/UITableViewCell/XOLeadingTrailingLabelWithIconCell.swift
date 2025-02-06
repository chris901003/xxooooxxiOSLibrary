// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/6.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOLeadingTrailingLabelWithIconCell: UITableViewCell {
    let titleLabel = UILabel()
    let infoLabel = UILabel()
    let iconView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        titleLabel.text = "Title"
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .black

        infoLabel.text = "Info"
        infoLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        infoLabel.textColor = .secondaryLabel

        iconView.image = UIImage(systemName: "chevron.right")?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal)
        iconView.contentMode = .scaleAspectFit
    }

    public func config(title: String, info: String, iconName: String = "chevron.right") {
        titleLabel.text = title
        infoLabel.text = info
        iconView.image = UIImage(systemName: iconName)?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal)
    }

    private func layout() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])

        contentView.addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 16),
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor)
        ])

        contentView.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -8),
            infoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
