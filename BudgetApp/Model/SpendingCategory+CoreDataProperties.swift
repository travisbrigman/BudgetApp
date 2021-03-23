//
//  SpendingCategory+CoreDataProperties.swift
//  BudgetApp
//
//  Created by Travis Brigman on 3/23/21.
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
    @NSManaged public var expenses: NSSet?
    
    public var wrappedCategoryName: String {
        categoryName ?? "Unknown"
    }
    
    public var expensesArray: [CategoryExpense] {
        let set = expenses as? Set<CategoryExpense> ?? []
        return set.sorted {
            $0.wrappedExpenseName < $1.wrappedExpenseName
        }
    }

}

// MARK: Generated accessors for expenses
extension SpendingCategory {

    @objc(addExpensesObject:)
    @NSManaged public func addToExpenses(_ value: CategoryExpense)

    @objc(removeExpensesObject:)
    @NSManaged public func removeFromExpenses(_ value: CategoryExpense)

    @objc(addExpenses:)
    @NSManaged public func addToExpenses(_ values: NSSet)

    @objc(removeExpenses:)
    @NSManaged public func removeFromExpenses(_ values: NSSet)

}
