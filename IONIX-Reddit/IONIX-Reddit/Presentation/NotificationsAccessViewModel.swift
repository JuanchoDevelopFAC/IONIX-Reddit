//
//  NotificationsAccessViewModel.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 5/11/23.
//

import Foundation
import UserNotifications

class NotificationsAccessViewModel: ObservableObject {
    
    @Published var notificationsPermissionGranted = false
    
    func notificationsAccessPeticion() {
        
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings { settings in
            switch settings.authorizationStatus {
                case .notDetermined:
                    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                        DispatchQueue.main.async {
                            self.notificationsPermissionGranted = granted
                        }
                }
                case .denied:
                    DispatchQueue.main.async {
                        self.notificationsPermissionGranted = false
                    }
                case .authorized:
                    DispatchQueue.main.async {
                        self.notificationsPermissionGranted = true
                    }
                case .provisional:
                    DispatchQueue.main.async {
                        self.notificationsPermissionGranted = true
                    }
                case .ephemeral:
                    DispatchQueue.main.async {
                        self.notificationsPermissionGranted = true
                    }
                @unknown default:
                    fatalError()
            }
        }
    }
}
