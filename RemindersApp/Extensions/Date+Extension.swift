//
//  Date+Extension.swift
//  RemindersApp
//
//  Created by Sarthak Deshmukh on 03/08/25.
//

import Foundation

extension Date {
    
    var isToday: Bool {
        let calender = Calendar.current
        return calender.isDateInToday(self)
    }
    
    var isTomorrow: Bool {
        let calender = Calendar.current
        return calender.isDateInTomorrow(self)
    }
    
    var DateComponents: DateComponents {
        Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: self)
    }
}
