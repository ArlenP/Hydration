//
//  HydrationApp.swift
//  Hydration Watch App
//
//  Created by Arlen Peña on 13/12/23.
//

import SwiftUI
import UserNotifications

@main
struct Hydration_Watch_AppApp: App {
    @StateObject var notificationManager = NotificationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    notificationManager.scheduleHourlyNotification()
                }
        }
    }
}

class NotificationManager: NSObject, ObservableObject {
    func scheduleHourlyNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notificaciones permitidas")
                let content = UNMutableNotificationContent()
                content.title = "¡Recuerda mantenerte hidratado!"
                content.body = "Es hora de tomar un descanso y tomar un vaso con agua"

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600, repeats: true)
                let request = UNNotificationRequest(identifier: "hourlyAlert", content: content, trigger: trigger)

                center.add(request) { error in
                    if let error = error {
                        print("Error al programar la notificación: \(error)")
                    }
                }
            } else {
                print("Notificaciones denegadas")
            }
        }
    }
}

