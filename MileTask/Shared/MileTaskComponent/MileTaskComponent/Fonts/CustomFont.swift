//
//  CustomFont.swift
//  MileTaskComponent
//
//  Created by asani on 26/06/25.
//

import SwiftUI

public typealias SwiftUIVW = SwiftUI.View

public extension Font {
    enum FontTypeWeight {
        case black
        case bold
        case light
        case medium
        case regular
    }

    static func customFont(type: FontTypeWeight, size: CGFloat) -> Font {
        let fontName: String
        switch type {
        case .black:
            fontName = "Roboto-Black"
        case .bold:
            fontName = "Roboto-Bold"
        case .light:
            fontName = "Roboto-Light"
        case .medium:
            fontName = "Roboto-Medium"
        case .regular:
            fontName = "Roboto-Regular"
        }

        return Font.custom(fontName, fixedSize: size)
    }

    enum Typography {
        case Custom(size: CGFloat, FontTypeWeight = .regular)

        public func font() -> Font {
            switch self {
            case .Custom(let size, let weight):
                return Font.customFont(type: weight, size: size)
            }
        }
    }
}

public struct TypographyModifier: ViewModifier {
    let typography: Font.Typography
    let lineLimit: Int?

    public func body(content: Content) -> some SwiftUI.View {
        content
            .lineLimit(lineLimit)
            .font(typography.font())
            .lineSpacing(6)
    }
}

public extension SwiftUIVW {
    func typographyStyle(lineLimit: Int? = nil, _ style: Font.Typography) -> some SwiftUI.View {
        self.modifier(TypographyModifier(typography: style, lineLimit: lineLimit))
    }
}
