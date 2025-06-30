//
//  LiveActivityManager.swift
//  MileTaskStorage
//
//  Created by asani on 30/06/25.
//

import ActivityKit
import Foundation
import MileTaskDomain

public class LiveActivityManager {
    public static let shared = LiveActivityManager()

    @discardableResult
    public func startActivity(endTime: Date, taskData: TaskModel) -> Activity<TimerAttributes>? {
        var activity: Activity<TimerAttributes>?
        let attributes = TimerAttributes(name: "Timer")

        do {
            let progress = calculateRemainingProgress(until: endTime)

            let state = TimerAttributes.ContentState(
                duration: endTime.getCurrentTime(),
                progress: progress,
                titleName: taskData.title ?? ""
            )
            activity = try Activity<TimerAttributes>.request(
                attributes: attributes,
                contentState: state,
                pushType: nil
            )
        } catch {
            print(error.localizedDescription)
        }
        return activity
    }

    public func updateActivity(activity: String, endTime: Date, taskData: TaskModel) {
        let progress = calculateRemainingProgress(until: endTime)

        Task {
            let contentState = TimerAttributes.ContentState(
                duration: endTime.getCurrentTime(),
                progress: progress,
                titleName: taskData.title ?? ""
            )
            let activity = Activity<TimerAttributes>.activities.first(where: { $0.id == activity })
            await activity?.update(using: contentState)
        }
    }

    public func endActivity() {
        Task {
            for activity in Activity<TimerAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
}
