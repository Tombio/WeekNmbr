//
//  Extension.swift
//  WeekNmbr
//
//  Created by Tomi Lahtinen on 08/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import Foundation

extension Date {
    
    func weekNumberOfYear() -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: self).weekOfYear!
    }
    
    func dayOfYear() -> Int {
        return Calendar.current.ordinality(of: .day, in: .year, for: self)!
    }
    
    func daysInYear() -> Int {
        var start = self.addingTimeInterval(0)
        var lengthOfInterval = TimeInterval()
        let _ = Calendar.current.dateInterval(of: .year, start: &start , interval: &lengthOfInterval, for: self)
        let endOfInterval = self.addingTimeInterval(lengthOfInterval)
        return Calendar.current.dateComponents(Set<Calendar.Component>([.day]), from: self, to: endOfInterval).day!
    }
}
