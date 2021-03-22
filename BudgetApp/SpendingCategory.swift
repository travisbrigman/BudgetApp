//
//  SpendingCategory.swift
//  BudgetApp
//
//  Created by Travis Brigman on 3/22/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import Foundation
import Foundation
/*
struct SpendingCategory: Hashable, Codable {
    let id: Int
    let categoryName: String
    var expenseItems: [String:String]
    
    var totalSpending: String {
        let expenseValues = expenseItems.values
        let expenseDoubles = expenseValues.compactMap{ Double($0)}
        let sum = expenseDoubles.reduce(0, +)
        return String(sum)
    }
}

class SpendingCategories: ObservableObject {
    var files = FileManager()
    
    @Published private(set) var categories: [SpendingCategory]
    
    static let saveKey = "SpendingCategories"
    
    init() {
        let fileName = self.files.getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        do {
            let data = try Data(contentsOf: fileName)
            let people = try JSONDecoder().decode([SpendingCategory].self, from: data)
            self.categories = people
        } catch {
            print("Unable to load saved data")
            self.categories = []
        }
    }
    
    private func save() {
        //find the documents directory associated with this app...
        let fileName = self.files.getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        
        do {
            //encode the array of categories to JSON
            let data = try JSONEncoder().encode(categories)
            //write what we just encoded to directory we found
            try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
            //print it to the console
            let input = try String(contentsOf: fileName)
            print(input)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func add(_ newCategory: SpendingCategory) {
        categories.append(newCategory)
        save()
    }
    
    func addExpense(_ categoryID: Int, _ expenseKey: String, _ expenseValue: String){
        var foundCategory = categories.first(where: { $0.id == categoryID })
        
        foundCategory?.expenseItems[expenseKey] = expenseValue
        print(foundCategory)
        save()
    }
}
*/
