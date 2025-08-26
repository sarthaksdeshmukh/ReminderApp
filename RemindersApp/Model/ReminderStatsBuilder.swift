//
//  ReminderStatsBuilder.swift
//  RemindersApp
//
//  Created by Sarthak Deshmukh on 16/08/25.
//

import Foundation
import SwiftUI

enum ReminderStatType {
    case today
    case all
    case schedule
    case completed
}

struct ReminderStatsValue {
    var todayCount: Int = 0
    var scheduleCount: Int = 0
    var allCount: Int = 0
    var completedCount: Int = 0
}

struct ReminderStatsBuilder {
    
    func build(myListResults: FetchedResults<MyList>) -> ReminderStatsValue {
        
        let reminderArray = myListResults.map {
            $0.remindersArray
        }.reduce([], +)
        
        let scheduleCount = calculateScheduleCount(reminders: reminderArray)
        let todaysCount = calculateTodayCount(reminders: reminderArray)
        let completedCount = calculateCompletedCount(reminders: reminderArray)
        let allCount = calculateAllCount(reminders: reminderArray)
        
        return ReminderStatsValue(todayCount: todaysCount, scheduleCount: scheduleCount,allCount: allCount,completedCount: completedCount)
    }
    
    private func calculateScheduleCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) {
            result, reminder in
            return ((reminder.reminderDate != nil || reminder.reminderTime != nil && !reminder.isCompleted)) ? result + 1 : result
        }
    }
    
    private func calculateTodayCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) {
            result, reminder in
            let today = reminder.reminderDate?.isToday ?? false
            return today ? result + 1 : result
        }
    }
    
    private func calculateCompletedCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) {
            result, reminder in
            return reminder.isCompleted ? result + 1 : result
        }
    }
    
    private func calculateAllCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) {
            result, reminder in
            return !reminder.isCompleted ? result + 1 : result
        }
    }
}
