//
//  ExpenseDetailView.swift
//  BudgetApp
//
//  Created by Travis Brigman on 3/22/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct ExpenseDetailView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var category: SpendingCategory
    @State private var isShowingEditExpenseItem = false
    
    var body: some View {
        
        NavigationView{
            List(category.expensesArray, id: \.self) { lineItem in
            HStack {
                Text(lineItem.wrappedExpenseName)
                Spacer()
                Text("$\(lineItem.expenseAmount, specifier: "%g")")
            }
            .padding(.horizontal)
        }
        }
            
        .navigationBarItems(trailing: Button(action: {
            self.isShowingEditExpenseItem = true
            
        }) {
            Image(systemName: "plus.square")
            Text("Expense")
        })
        .sheet(isPresented: $isShowingEditExpenseItem) {
            EditCategoryExpense(spendingCategory: self.category)
            .environment(\.managedObjectContext, self.moc)
        }
 
    }
}

//struct ExpenseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpenseDetailView()
//    }
//}

 
 
