//
//  ExtensionDelegate.swift
//  WeekNmbrWatchApp Extension
//
//  Created by Tomi Lahtinen on 07/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    let userInfo = ["reason" : "background update"] as NSDictionary
    
    func applicationDidFinishLaunching() {
        WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: Date(timeIntervalSinceNow: 3.0), userInfo: userInfo) { (error) in
            if (error == nil) {
                print("successfully scheduled background task, use the crown to send the app to the background and wait for handle:BackgroundTasks to fire.")
            }
        }
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        debugPrint("Handle background tasks fired")
        for task in backgroundTasks {
            switch task {
            case let backgroundTask as WKApplicationRefreshBackgroundTask:
                let date = Date()
                ComplicationDataSource.date = date
                debugPrint("Next update schedule to \(date.nextHour())")
                WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: date.nextHour(), userInfo: nil, scheduledCompletion: { _ in })
                backgroundTask.setTaskCompleted()
            default:
                // make sure to complete unhandled task types
                task.setTaskCompleted()
            }
        }
    }

}
