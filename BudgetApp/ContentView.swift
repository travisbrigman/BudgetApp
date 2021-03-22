//
//  ContentView.swift
//  BudgetApp
//
//  Created by Travis Brigman on 3/22/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

class Budget: ObservableObject {
    @Published var monthlyTakeHomePay = ""
    
    var tithe: String {
        let takeHomePay = Double(monthlyTakeHomePay) ?? 0
        let tithe = takeHomePay / 10.0
        return String(tithe)
    }
    var monthlyNet: String {
        let takeHomePay = Double(monthlyTakeHomePay) ?? 0
        let titheAmount = Double(tithe) ?? 0
        return String(takeHomePay - titheAmount)
    }
}

struct ContentView: View {
//    @ObservedObject var spendingCategories = SpendingCategories()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: SpendingCategory.entity(), sortDescriptors: []) var spendingCategories: FetchedResults<SpendingCategory>
    @ObservedObject private var budget = Budget()
    @State private var isShowingEditSpending = false
    
    
//    var categorySum: String {
//        var allSpending = 0.0
//        for category in spendingCategories {
//            allSpending += Double(category.totalSpending) ?? 0
//        }
//        return String(allSpending)
//    }
    
//    var takeHomeRemainder: String {
//        guard let monthlyNetIncome = Double(budget.monthlyNet), let spendingCategoryTotal = Double(categorySum) else { return "No Value" }
//
//        let monthlyRemainder = monthlyNetIncome - spendingCategoryTotal
//        return String(monthlyRemainder)
//
//    }
    
    var body: some View {
        NavigationView{
            VStack {
                Section {
                    Text("Monthly Take Home Pay: $\(budget.monthlyTakeHomePay)")
                    Text("10% tithe: $\(budget.tithe)")
                    Text("Monthly Net: $\(budget.monthlyNet)")
                }
                
                TextField("take home pay", text: $budget.monthlyTakeHomePay)
                
                List(spendingCategories, id: \.self) { category in
                    VStack {
                        Text(category.wrappedCategoryName)
//                        NavigationLink(category.wrappedCategoryName, destination: ExpenseDetailView(category: category))
//                        Text("$ \(category.totalSpending)")
                    }
                }
//                Text("$ \(categorySum)")
//                Text(takeHomeRemainder)
            }
            .navigationBarItems(trailing: Button(action: {
                self.isShowingEditSpending = true
                
            }) {
                Image(systemName: "plus.square")
                Text("Category")
            })
        }
        .sheet(isPresented: $isShowingEditSpending) {
            EditSpendingCategory()
                .environment(\.managedObjectContext, self.moc)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
