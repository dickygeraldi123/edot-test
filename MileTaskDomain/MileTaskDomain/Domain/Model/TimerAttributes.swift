//
//  TimerAttributes.swift
//  MileTaskDomain
//
//  Created by asani on 30/06/25.
//

import ActivityKit

public struct TimerAttributes: ActivityAttributes {
    public typealias TimeTrackingStatus = ContentState

    public struct ContentState: Codable, Hashable {
        public var duration: String
        public var progress: Double
        public var titleName: String

        public init(duration: String, progress: Double, titleName: String) {
            self.duration = duration
            self.progress = progress
            self.titleName = titleName
        }
    }

    public var name: String

    public init(name: String) {
        self.name = name
    }
}
