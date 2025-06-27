//
//  UIColor+Hex.swift
//  MileTaskComponent
//
//  Created by asani on 26/06/25.
//

import SwiftUI

public extension Color {
    init(from uiColor: UIColor) {
        self.init(uiColor.cgColor)
    }
}

public extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")

        hexSanitized = hexSanitized.uppercased()

        var rgb: UInt64 = 0
        let scanner = Scanner(string: hexSanitized)
        guard scanner.scanHexInt64(&rgb) else { return nil }

        switch hexSanitized.count {
        case 8:
            let r = Double((rgb & 0xFF000000) >> 24) / 255.0
            let g = Double((rgb & 0x00FF0000) >> 16) / 255.0
            let b = Double((rgb & 0x0000FF00) >> 8) / 255.0
            let a = Double(rgb & 0x000000FF) / 255.0
            self.init(.sRGB, red: r, green: g, blue: b, opacity: a)

        case 6:
            let a = 1.0
            let r = Double((rgb & 0xFF0000) >> 16) / 255.0
            let g = Double((rgb & 0x00FF00) >> 8) / 255.0
            let b = Double(rgb & 0x0000FF) / 255.0
            self.init(.sRGB, red: r, green: g, blue: b, opacity: a)

        default:
            return nil
        }
    }
}

public extension Color {
    init(light: Color, dark: Color) {
        self = Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
    }
}
