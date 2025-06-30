//
//  Date+Ext.swift
//  MileTaskDomain
//
//  Created by asani on 30/06/25.
//

import Foundation

public func calculateRemainingProgress(until endTime: Date) -> Double {
    let now = Date()
    let totalDuration = endTime.timeIntervalSince(now)
    guard totalDuration > 0 else { return 0.0 }

    let progress = max(0.0, min(1.0 - (totalDuration / endTime.timeIntervalSince(now)), 1.0))
    return progress
}

public extension Date {
    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH : mm : ss"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: self)
    }
}
