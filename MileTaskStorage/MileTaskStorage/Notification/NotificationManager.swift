import Foundation
import UserNotifications
import MileTaskDomain
import CoreData

public final class NotificationManager {
    public static let shared = NotificationManager()

    private init() {
        registerCategories()
    }

    private func registerCategories() {
        let snoozeAction = UNNotificationAction(
            identifier: "snoozeAction",
            title: "Snooze",
            options: []
        )
        let cancelAction = UNNotificationAction(
            identifier: "cancelAction",
            title: "Cancel",
            options: [.destructive]
        )

        let category = UNNotificationCategory(
            identifier: "taskCategory",
            actions: [snoozeAction, cancelAction],
            intentIdentifiers: [],
            options: []
        )

        UNUserNotificationCenter.current().setNotificationCategories([category])
    }

    public func scheduleNotification(for task: TaskModel) {
        guard let taskTitle = task.title else { return }

        let startDate = Date(timeIntervalSince1970: task.startDate)
        let fireDate = startDate.addingTimeInterval(-300) // ⏰ 5 minutes before start

        let timeInterval = fireDate.timeIntervalSinceNow
        guard timeInterval > 1 else {
            print("⚠️ Skipped notification: start time is too close or in the past.")
            return
        }

        let content = UNMutableNotificationContent()
        content.title = "Upcoming Task"
        content.body = taskTitle
        content.sound = .default
        content.categoryIdentifier = "taskCategory"

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: timeInterval,
            repeats: false
        )

        let identifier = task.id?.uuidString ?? UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("🔴 Notification scheduling failed: \(error.localizedDescription)")
            } else {
                print("✅ Notification scheduled for \(taskTitle) at \(fireDate)")
            }
        }
    }

    public func scheduleNotificationsForUpcomingTasks(context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<TaskModel> = TaskModel.fetchRequest()

        do {
            let tasks = try context.fetch(fetchRequest)
            let now = Date()

            for task in tasks {
                let startDate = Date(timeIntervalSince1970: task.startDate)
                let timeInterval = startDate.timeIntervalSince(now)

                if timeInterval > 1 && timeInterval <= 500 {
                    scheduleNotification(for: task)
                }
            }
        } catch {
            print("❌ Failed to fetch tasks: \(error.localizedDescription)")
        }
    }
}
