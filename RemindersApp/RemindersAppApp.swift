//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Sarthak Deshmukh on 02/08/25.
//

import SwiftUI
import UserNotifications

@main
struct RemindersAppApp: App {
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound, .badge]) { granted, error in
            if granted {
                
            }else {
                
            }
        }
    }
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
        }
    }
}
