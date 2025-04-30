// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/6.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOLeadingTrailingLabelCell: UITableViewCell {
    public static let cellId = "XO_LEADING_TRAILING_LABEL_CELL_ID"

    let titleLabel = UILabel()
    let infoLabel = UILabel()

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
    }

    public func config(title: String, info: String) {
        titleLabel.text = title
        infoLabel.text = info
    }

    private func layout() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])

        contentView.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
