//
//  EditCategoryExpense.swift
//  BudgetApp
//
//  Created by Travis Brigman on 3/22/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//
/*
import Foundation
import SwiftUI

struct EditCategoryExpense: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var spendingCategories: SpendingCategories
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
                    ForEach(spendingCategory.expenseItems.sorted(by: <), id: \.key) { key, value in
                        HStack {
                            Text(key)
                            Spacer()
                            Text("$\(value)")
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

        spendingCategories.addExpense(spendingCategory.id, trimmedExpense, trimmedAmount)
        
    }
}

//struct EditCategoryExpense_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCategoryExpense(spendingCategory: SpendingCategory(from: <#Decoder#>))
//    }
//}

*/
