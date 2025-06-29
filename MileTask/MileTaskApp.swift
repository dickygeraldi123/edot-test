//
//  MileTaskApp.swift
//  MileTask
//
//  Created by asani on 26/06/25.
//

import SwiftUI
import MileTaskComponent

@main
struct MileTaskApp: App {
    init() {
        FontManager.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            HomeMainView()
        }
    }
}
