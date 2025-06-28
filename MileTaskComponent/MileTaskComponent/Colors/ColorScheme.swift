//
//  ColorScheme.swift
//  MileTaskComponent
//
//  Created by asani on 26/06/25.
//

import SwiftUI

public extension Color {
    // MARK: - Coloring Asset

    // Primary Background
    static let backgroundPrimaryBlack = Color(hex: "111111")!
    static let backgroundPrimaryLight = Color(hex: "FFFFFF")!

    // Primary Secondary
    static let backgroundSecondaryBlack = Color(hex: "232323")!
    static let backgroundSecondaryLight = Color(hex: "EEEEEE")!

    // Text Color
    static let primaryTextBlack = Color(hex: "fbfbfb")!
    static let secondaryTextBlack = Color(hex: "d8d8d8")!
    static let primaryTextLight = Color(hex: "202124")!
    static let secondaryTextLight = Color(hex: "6E6E6E")!

    // Additional Color
    static let creamColor = Color(hex: "ffe3c3")!
    static let lightCreamColor = Color(hex: "37413e")!
    static let softPurpleColor = Color(hex: "dbd4fd")!
    static let softGreenColor = Color(hex: "defff9")!
    static let softLimeColor = Color(hex: "e6f19d")!

    // Solid Color
    static let whiteColor = Color(hex: "FFFFFF")!
    static let darkColor = Color(hex: "000000")!
    static let borderWhite = Color(hex: "C2C2C2")!
    static let borderDark = Color(hex: "E2E2E2")!

    // MARK: - Usage Color
    // Background
    static let BackgroundPrimary = Color(light: .backgroundPrimaryBlack, dark: .backgroundPrimaryLight)
    static let BackgroundSecondaryPrimary = Color(light: .backgroundSecondaryBlack, dark: .backgroundSecondaryLight)

    // Text
    static let TextSolid = Color(light: .darkColor, dark: .whiteColor)
    static let TextPrimary = Color(light: .primaryTextLight, dark: .primaryTextBlack)
    static let TextSecondary = Color(light: .secondaryTextLight, dark: .secondaryTextBlack)
    static let TextInversePrimary = Color(light: .primaryTextBlack, dark: .primaryTextLight)
    static let TextInverseSecondary = Color(light: .secondaryTextBlack, dark: .secondaryTextLight)

    // Border
    static let borderLinePrimary = Color(light: .borderDark, dark: .borderWhite)
}
