//
//  MileTaskLiveActivityLiveActivity.swift
//  MileTaskLiveActivity
//
//  Created by asani on 30/06/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MileTaskLiveActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MileTaskLiveActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MileTaskLiveActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MileTaskLiveActivityAttributes {
    fileprivate static var preview: MileTaskLiveActivityAttributes {
        MileTaskLiveActivityAttributes(name: "World")
    }
}

extension MileTaskLiveActivityAttributes.ContentState {
    fileprivate static var smiley: MileTaskLiveActivityAttributes.ContentState {
        MileTaskLiveActivityAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MileTaskLiveActivityAttributes.ContentState {
         MileTaskLiveActivityAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MileTaskLiveActivityAttributes.preview) {
   MileTaskLiveActivityLiveActivity()
} contentStates: {
    MileTaskLiveActivityAttributes.ContentState.smiley
    MileTaskLiveActivityAttributes.ContentState.starEyes
}
