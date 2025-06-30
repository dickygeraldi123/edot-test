//
//  TimerAttributes.swift
//  MileTask
//
//  Created by asani on 30/06/25.
//

import ActivityKit

struct TimerAttributes: ActivityAttributes {
    public typealias TimeTrackingStatus = ContentState

    public struct ContentState: Codable, Hashable {
        var duration: String
        var progress: Double
        var titleName: String
    }

    var name: String
}
