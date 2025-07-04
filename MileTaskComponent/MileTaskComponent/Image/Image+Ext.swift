//
//  Image+Ext.swift
//  MileTaskComponent
//
//  Created by asani on 26/06/25.
//

import SwiftUI

public extension Image {
    static func ComponentImage(named: String) -> Image? {
        return Image(named)
    }

    static func getImageByMode(named: String) -> String {
        return UIScreen.main.traitCollection.userInterfaceStyle == .dark ?
            "\(named)_white" : "\(named)_dark"
    }
}
