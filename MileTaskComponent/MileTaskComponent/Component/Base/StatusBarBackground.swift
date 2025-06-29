//
//  StatusBarBackground.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

struct StatusBarBackground: View {
    var color: Color

    var body: some View {
        GeometryReader { geometry in
            color
                .frame(height: geometry.safeAreaInsets.top)
                .edgesIgnoringSafeArea(.top)
                .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top / 2)
        }
        .allowsHitTesting(false)
    }
}
