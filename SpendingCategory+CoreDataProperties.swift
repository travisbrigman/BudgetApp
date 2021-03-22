//
//  SpendingCategory+CoreDataProperties.swift
//  BudgetApp
//
//  Created by Travis Brigman on 3/22/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//
//

import Foundation
import CoreData


extension SpendingCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SpendingCategory> {
        return NSFetchRequest<SpendingCategory>(entityName: "SpendingCategory")
    }

    @NSManaged public var categoryName: String?
    @NSManaged public var id: Int16
    
    public var wrappedCategoryName: String {
        categoryName ?? "Unknown Category"
    }

}
