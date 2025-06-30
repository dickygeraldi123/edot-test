//
//  MileTaskApp.swift
//  MileTask
//
//  Created by asani on 26/06/25.
//

import SwiftUI
import MileTaskComponent
import MileTaskStorage

@main
struct MileTaskApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        FontManager.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            CustomNavigationView(appRouter: .init())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self

        registerNotificationCategories()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }

        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func registerNotificationCategories() {
        let snoozeAction = UNNotificationAction(identifier: "snoozeAction", title: "Snooze", options: [])
        let cancelAction = UNNotificationAction(identifier: "cancelAction", title: "Cancel", options: [.destructive])
        let category = UNNotificationCategory(identifier: "taskCategory", actions: [snoozeAction, cancelAction], intentIdentifiers: [], options: [])

        UNUserNotificationCenter.current().setNotificationCategories([category])
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        let id = response.notification.request.identifier
        let content = response.notification.request.content

        switch response.actionIdentifier {
        case "snoozeAction":
            print("🔁 Snooze pressed for \(id)")
            let newTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 300, repeats: false)
            let newRequest = UNNotificationRequest(identifier: id, content: content, trigger: newTrigger)
            UNUserNotificationCenter.current().add(newRequest)

        case "cancelAction":
            print("❌ Cancel pressed for \(id)")
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])

        default:
            break
        }

        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Handle foreground presentation options
        completionHandler([.alert, .sound, .badge])
    }
}
