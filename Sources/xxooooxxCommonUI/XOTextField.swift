// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/5.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public class XOTextField: UITextField {
    var textPadding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

    public init(_ padding: UIEdgeInsets? = nil) {
        super.init(frame: .zero)
        if let padding { textPadding = padding }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
