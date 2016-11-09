//
//  ViewController.swift
//  WeekNmbr
//
//  Created by Tomi Lahtinen on 07/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekNumberLabel: UILabel!
    @IBOutlet weak var weekNumber: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var dayOfYear: UILabel!
    
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .medium
        
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // 227,213,185 / Brown
        // 193,55,84 / Red
    }
    
    func update() {
        let date = Date()
        weekNumber.text = "\(date.weekNumberOfYear())"
        let daysLeft = date.daysInYear() - date.dayOfYear()
        dayOfYear.text = String(format: "%d / %d", date.dayOfYear(), daysLeft)
        dateLabel.text = dateFormatter.string(from: date)
        timeLabel.text = timeFormatter.string(from: date)
    }
}
