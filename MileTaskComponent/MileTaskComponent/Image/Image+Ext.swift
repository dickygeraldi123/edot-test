//
//  Image+Ext.swift
//  MileTaskComponent
//
//  Created by asani on 26/06/25.
//

import SwiftUI

class Component {}

public extension Image {
    static func ComponentImage(named: String) -> Image? {
        return Image(named, bundle: Bundle(for: Component.self))
    }
}
