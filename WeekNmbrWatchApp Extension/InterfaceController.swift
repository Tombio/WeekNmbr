//
//  InterfaceController.swift
//  WeekNmbrWatchApp Extension
//
//  Created by Tomi Lahtinen on 07/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var weekLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        super.willActivate()
        weekLabel.setText("\(Date().weekNumberOfYear())")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
