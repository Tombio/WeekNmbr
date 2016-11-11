//
//  IndexRequestHandler.swift
//  WeekNmbrSpotlightExtension
//
//  Created by Tomi Lahtinen on 10/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import CoreSpotlight
import MobileCoreServices

class IndexRequestHandler: CSIndexExtensionRequestHandler {

    let identifier = "Identifier_week_number"
    let domainIdentifier = "fi.solita.WeekNmbr"
    
    override func searchableIndex(_ searchableIndex: CSSearchableIndex, reindexAllSearchableItemsWithAcknowledgementHandler acknowledgementHandler: @escaping () -> Void) {
        // Reindex all data with the provided index
        debugPrint("Re-index all")
        indexWeekNumber()
        acknowledgementHandler()
    }
    
    override func searchableIndex(_ searchableIndex: CSSearchableIndex, reindexSearchableItemsWithIdentifiers identifiers: [String], acknowledgementHandler: @escaping () -> Void) {
        // Reindex any items with the given identifiers and the provided index
        debugPrint("Re-index identifiers")
        indexWeekNumber()
        acknowledgementHandler()
    }
    
    func indexWeekNumber() {
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        attributeSet.title = "Week number \(Date().weekNumberOfYear())"
        attributeSet.contentDescription = "Current week number"
        let item = CSSearchableItem(uniqueIdentifier: "\(identifier)", domainIdentifier: domainIdentifier, attributeSet: attributeSet)
        item.expirationDate = Date().endOfDay()
        print(item.expirationDate)
        CSSearchableIndex.default().indexSearchableItems([item]) { error in
            if let error = error {
                print("Indexing error: \(error.localizedDescription)")
            } else {
                print("Search item successfully indexed!")
            }
        }
        
    }

}
