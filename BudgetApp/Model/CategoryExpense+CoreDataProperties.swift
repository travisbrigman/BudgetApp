//
//  CategoryExpense+CoreDataProperties.swift
//  BudgetApp
//
//  Created by Travis Brigman on 3/23/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//
//

import Foundation
import CoreData


extension CategoryExpense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryExpense> {
        return NSFetchRequest<CategoryExpense>(entityName: "CategoryExpense")
    }

    @NSManaged public var expenseAmount: Double
    @NSManaged public var expenseName: String?
    @NSManaged public var spendingCategory: SpendingCategory?
    
    public var wrappedExpenseName: String {
        expenseName ?? "Unknown"
    }
    

}
