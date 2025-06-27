//
//  Untitled.swift
//  MileTaskComponent
//
//  Created by asani on 26/06/25.
//

import CoreText
import UIKit

public class FontManager {
    public static func registerFonts() {
        let bundle = Bundle(for: FontManager.self)
        let registeredFontFamily = [
            "Roboto-Black.otf",
            "Roboto-Bold.otf",
            "Roboto-Light.otf",
            "Roboto-Medium.otf",
            "Roboto-Regular.otf",
            "Roboto-Thin.otf"
        ]

        for ff in registeredFontFamily {
            UIFont.regsterFont(fontName: ff, bundle: bundle)
        }
    }
}

private extension UIFont {
    static func regsterFont(fontName: String, bundle: Bundle) {
        guard let pathForResource = bundle.path(forResource: fontName, ofType: nil) else {return}
        guard let fontData = NSData(contentsOfFile: pathForResource) else {return}
        guard let dataProvider = CGDataProvider(data: fontData) else {return}
        guard let font = CGFont(dataProvider) else {return}

        var error: Unmanaged<CFError>?
        _ = CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
