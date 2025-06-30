//
//  MileTaskLiveActivityLiveActivity.swift
//  MileTaskLiveActivity
//
//  Created by asani on 30/06/25.
//

import ActivityKit
import WidgetKit
import MileTaskComponent
import SwiftUI

// MARK: - Views
struct LiveActivityContent: View {
    let state: TimerAttributes.ContentState

    var body: some View {
        HStack {
            Text(state.titleName)
                .typographyStyle(.Custom(size: 16, .bold))
                .foregroundColor(.TextPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)

            Spacer()

            HStack(alignment: .center, spacing: 16) {
                WidgetCircleTimerView(
                    progress: state.progress,
                    duration: state.duration
                )

                Text(state.duration)
                    .foregroundStyle(Color.TextPrimary)
                    .font(.largeTitle.monospacedDigit())
                    .minimumScaleFactor(0.8)
                    .contentTransition(.numericText())
                .animation(.spring(response: 0.2), value: state.progress)
            }

        }
        .id(state)
        .transition(.identity)
        .padding()
        .foregroundColor(Color.softLimeColor)
    }
}

@DynamicIslandExpandedContentBuilder
private func expandedContent(state: TimerAttributes.ContentState) -> DynamicIslandExpandedContent<some View> {
    DynamicIslandExpandedRegion(.leading) {
        Image(systemName: "timer.circle.fill")
            .resizable()
            .frame(width: 44.0, height: 44.0)
            .foregroundColor(Color.lightCreamColor)
    }
    DynamicIslandExpandedRegion(.center) {
        VStack {
            Text(state.duration + " remaining")
                .font(.title)
                .minimumScaleFactor(0.8)
                .contentTransition(.numericText())
            Spacer()
            Text(state.titleName)
                .typographyStyle(.Custom(size: 16, .bold))
                .foregroundColor(.TextPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
        }
        .id(state)
        .transition(.identity)
    }
}

struct MileTaskLiveActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimerAttributes.self) { context in
            LiveActivityContent(state: context.state)
                //.activityBackgroundTint(Color.liveActivityBackground.opacity(0.25))
                .activitySystemActionForegroundColor(Color.softLimeColor)

        } dynamicIsland: { context in
            DynamicIsland {
                expandedContent(state: context.state)
            } compactLeading: {
                Image(systemName: "timer")
                    .transition(.identity)
                    .foregroundColor(Color.lightCreamColor)
                    .padding(8)
            } compactTrailing: {
                Text(context.state.duration)
                    .minimumScaleFactor(0.8)
                    .contentTransition(.numericText())
                    .monospacedDigit()
                    .foregroundColor(Color.TextPrimary)
                    .padding(8)
            } minimal: {
                Image(systemName: "timer")
                    .foregroundColor(Color.lightCreamColor)
            }
        }
    }
}

extension TimerAttributes {
    fileprivate static var preview: TimerAttributes {
        TimerAttributes(name: "Timer")
    }
}
