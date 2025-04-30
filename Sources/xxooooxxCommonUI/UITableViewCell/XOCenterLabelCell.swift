// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/8.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOCenterLabelCell: UITableViewCell {
    public static let cellId = "XOCenterLabelCellId"

    let labelView = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func config(label: String, font: UIFont? = nil, color: UIColor? = nil) {
        labelView.text = label
        if let font { labelView.font = font }
        if let color { labelView.textColor = color }
    }

    private func setup() {
        labelView.textAlignment = .center
        labelView.text = "XOLabel"
    }

    private func layout() {
        contentView.addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            labelView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            labelView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
}
