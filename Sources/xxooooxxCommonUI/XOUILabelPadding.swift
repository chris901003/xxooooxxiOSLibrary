// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/3/14.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOUILabelPadding: UILabel {
    public let padding: UIEdgeInsets

    public init(padding: UIEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)) {
        self.padding = padding
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    public override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
}
