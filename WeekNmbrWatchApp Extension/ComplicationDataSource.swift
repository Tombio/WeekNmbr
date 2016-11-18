//
//  ComplicationDataSource.swift
//  WeekNmbr
//
//  Created by Tomi Lahtinen on 07/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import ClockKit

class ComplicationDataSource: NSObject, CLKComplicationDataSource {
    
    public static var date = Date()
    
    public func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Swift.Void) {
        handler([])
    }
    
    public func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Swift.Void) {
        handler(createTimelineEntry(for: complication, forDate: ComplicationDataSource.date))
    }
    
    private func createTimelineEntry(for complication: CLKComplication, forDate date: Date) -> CLKComplicationTimelineEntry? {
        if complication.family == .circularSmall {
            let template = CLKComplicationTemplateCircularSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "\(date.weekNumberOfYear())")
            template.fillFraction = Float(date.weekNumberOfYear()) / 52
            template.ringStyle = CLKComplicationRingStyle.closed
            return CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
        }
        else if complication.family == .modularSmall {
            let template = CLKComplicationTemplateModularSmallStackText()
            template.line1TextProvider = CLKSimpleTextProvider(text: "\(date.shortDateName()) \(date.dayOfMonth())")
            template.line2TextProvider = CLKSimpleTextProvider(text: "\(date.weekNumberOfYear())")
            template.highlightLine2 = true
            return CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
        }
        else if complication.family == .modularLarge{
            let template = CLKComplicationTemplateModularLargeStandardBody()
            template.headerTextProvider = CLKSimpleTextProvider(text: "Week")
            template.body1TextProvider = CLKSimpleTextProvider(text: "\(date.weekNumberOfYear())")
        }
        return nil
    }
    
    public func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Swift.Void) {
        handler(.showOnLockScreen)
    }
}
