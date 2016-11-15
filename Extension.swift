//
//  Extension.swift
//  WeekNmbr
//
//  Created by Tomi Lahtinen on 08/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import Foundation

extension Date {
    
    private static let dayNameShort: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter
    }()
    
    func weekNumberOfYear() -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: self).weekOfYear!
    }
    
    func dayOfYear() -> Int {
        return Calendar.current.ordinality(of: .day, in: .year, for: self)!
    }
    
    func dayOfMonth() -> Int {
        return Calendar.current.ordinality(of: .day, in: .month, for: self)!
    }
    
    func daysInYear() -> Int {
        var start = self.addingTimeInterval(0)
        var lengthOfInterval = TimeInterval()
        let _ = Calendar.current.dateInterval(of: .year, start: &start , interval: &lengthOfInterval, for: self)
        let endOfInterval = self.addingTimeInterval(lengthOfInterval)
        return Calendar.current.dateComponents(Set<Calendar.Component>([.day]), from: self, to: endOfInterval).day!
    }
    
    
    func endOfDay() -> Date {
        return Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: self)!
    }
    
    func startOfday() -> Date {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
    
    func shortDateName() -> String {
        let str = Date.dayNameShort.string(from: self)
        let index = str.index(str.startIndex, offsetBy: 2)
        return str.substring(to: index)
    }
    
    func yesterday() -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = -1
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    func tomorrow() -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = 1
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    func nextHour() -> Date {
        let currentComps = Calendar.current.dateComponents([.hour, .minute, .second, .nanosecond], from: self)
        var comps = DateComponents()
        comps.hour = 1
        comps.minute = -currentComps.minute!
        comps.second = -currentComps.second!
        comps.nanosecond = -currentComps.nanosecond!
        return Calendar.current.date(byAdding: comps, to: self)!
    }
}
