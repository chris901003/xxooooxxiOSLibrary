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

extension UIColor {
    public var toHexString: String {
        guard let components = cgColor.components, components.count >= 3 else {
            return "#FFFFFF"
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        let a = Float(cgColor.alpha)
        
        if a < 1.0 {
            // 帶 alpha
            return String(format: "#%02lX%02lX%02lX%02lX",
                          lroundf(Float(a * 255)),
                          lroundf(Float(rgba.r * 255)),
                          lroundf(Float(rgba.g * 255)),
                          lroundf(Float(rgba.b * 255)))
        } else {
            // 不帶 alpha
            return String(format: "#%02lX%02lX%02lX",
                          lroundf(Float(rgba.r * 255)),
                          lroundf(Float(rgba.g * 255)),
                          lroundf(Float(rgba.b * 255)))
        }
    }

    // 方便取得 RGBA
    private var rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
}
