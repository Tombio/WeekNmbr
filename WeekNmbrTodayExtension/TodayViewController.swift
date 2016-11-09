//
//  TodayViewController.swift
//  WeekNmbrTodayExtension
//
//  Created by Tomi Lahtinen on 08/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var weekLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        let date = Date()
        weekLabel.text = "Week \(date.weekNumberOfYear())"
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        update()
        completionHandler(NCUpdateResult.newData)
    }
    
}
