//
//  WidgetCircleTimerView.swift
//  MileTaskComponent
//
//  Created by asani on 30/06/25.
//

import SwiftUI

public struct WidgetCircleTimerView: View {
    var progress: Double
    var duration: String

    public init(progress: Double, duration: String) {
        self.progress = progress
        self.duration = duration
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.25)
                .foregroundColor(.white)
                .frame(width: 36, height: 36)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(270.0))
                .foregroundColor(Color.creamColor)
                .frame(width: 36, height: 36)
        }
    }
}
