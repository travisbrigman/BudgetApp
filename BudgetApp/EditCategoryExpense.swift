//
//  EditCategoryExpense.swift
//  BudgetApp
//
//  Created by Travis Brigman on 3/22/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import Foundation
import SwiftUI

struct EditCategoryExpense: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @State private var expenseNameKey = ""
    @State private var expenseAmountValue = ""
    var spendingCategory: SpendingCategory
    var body: some View {
       NavigationView {
            List {
                Section(header: Text("Add new Category Expense")) {
                    TextField("Expense", text: $expenseNameKey)
                    TextField("Amount", text: $expenseAmountValue)
                    
                    Button("Add Expense", action: addExpense)
                }

                Section {
                    List(spendingCategory.expensesArray, id: \.self ) { item in
                        HStack {
                            Text(item.wrappedExpenseName)
                            Spacer()
                            Text("$\(item.expenseAmount)")
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitle("Edit Expenses")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
            .listStyle(GroupedListStyle())
        }
    }
    
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func addExpense() {
        let trimmedExpense = expenseNameKey.trimmingCharacters(in: .whitespaces)
        let trimmedAmount = expenseAmountValue.trimmingCharacters(in: .whitespaces)
        
        guard trimmedExpense.isEmpty == false || trimmedAmount.isEmpty == false else { return }
        let newExpense = CategoryExpense(context: self.moc)
        newExpense.expenseName = trimmedExpense
        newExpense.expenseAmount = Double(trimmedAmount) ?? 0
//        newExpense.spendingCategory = self.spendingCategory
        
        try? self.moc.save()
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct EditCategoryExpense_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCategoryExpense(spendingCategory: SpendingCategory(from: <#Decoder#>))
//    }
//}


