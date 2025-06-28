//
//  Image+Ext.swift
//  MileTaskComponent
//
//  Created by asani on 26/06/25.
//

import SwiftUI

public extension Image {
    static func ComponentImage(named: String) -> Image? {
        return Image(named, bundle: Bundle(identifier: "test.MileTaskComponent"))
    }

    static func getImageByMode(named: String) -> String {
        return UIScreen.main.traitCollection.userInterfaceStyle == .dark ?
            "\(named)_Dark" : "\(named)_white"
    }
}
