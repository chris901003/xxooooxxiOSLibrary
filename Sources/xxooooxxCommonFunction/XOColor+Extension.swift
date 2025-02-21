// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/20.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

extension UIColor {
    public convenience init(hexCode: String, alpha: CGFloat = 1) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        var rgbColorValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbColorValue)
        self.init(
            red: CGFloat((rgbColorValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbColorValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbColorValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
