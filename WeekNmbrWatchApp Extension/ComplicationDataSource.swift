//
//  ComplicationDataSource.swift
//  WeekNmbr
//
//  Created by Tomi Lahtinen on 07/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import ClockKit

class ComplicationDataSource: NSObject, CLKComplicationDataSource {

    public func getNextRequestedUpdateDate(handler: @escaping (Date?) -> Swift.Void) {
        handler(Date(timeIntervalSinceNow: 60*60))
    }
    
    public func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Swift.Void) {
        handler([.backward, .forward])
    }
    
    public func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Swift.Void) {
            let date = Date()
            if complication.family == .circularSmall {
                let template = CLKComplicationTemplateCircularSmallRingText()
                template.textProvider = CLKSimpleTextProvider(text: "\(date.weekNumberOfYear())")
                template.fillFraction = Float(date.weekNumberOfYear()) / 52
                template.ringStyle = CLKComplicationRingStyle.closed
                
                let timelineEntry = CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
                handler(timelineEntry)
            }
            else if complication.family == .modularSmall {
                let template = CLKComplicationTemplateModularSmallStackText()
                template.line1TextProvider = CLKSimpleTextProvider(text: "Week")
                template.line2TextProvider = CLKSimpleTextProvider(text: "\(date.weekNumberOfYear())")
                template.highlightLine2 = true
                let timelineEntry = CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
                handler(timelineEntry)
            }
            else if complication.family == .modularLarge{
                let template = CLKComplicationTemplateModularLargeStandardBody()
                template.headerTextProvider = CLKSimpleTextProvider(text: "Week")
                template.body1TextProvider = CLKSimpleTextProvider(text: "\(date.weekNumberOfYear())")
            }
            else {
                handler(nil)
            }
        }
    
    public func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Swift.Void) {
        handler(.showOnLockScreen)
    }
    
    public func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(Date())
    }
    
    public func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(Date())
    }
}
