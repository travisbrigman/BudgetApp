//
//  EditSpendingCategory.swift
//  BudgetApp
//
//  Created by Travis Brigman on 3/22/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import Foundation
import SwiftUI

struct EditSpendingCategory: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: SpendingCategory.entity(), sortDescriptors: []) var spendingCategories: FetchedResults<SpendingCategory>
    @State private var categoryName = ""
    var body: some View {
                NavigationView {
            List {
                Section(header: Text("Add new Spending Category")) {
                    TextField("Category Name", text: $categoryName)
                    
                    Button("Add Category", action: addCategory)
                }

                Section {
                    ForEach(0..<spendingCategories.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(self.spendingCategories[index].wrappedCategoryName)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationBarTitle("Edit Categories")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
            .listStyle(GroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func addCategory() {
        let trimmedCategory = categoryName.trimmingCharacters(in: .whitespaces)
        var id = 0
        
        guard trimmedCategory.isEmpty == false else { return }
        let newCategory = SpendingCategory(context: self.moc)
        newCategory.categoryName = self.categoryName
        newCategory.id = Int16(id)
        id += 1
        try? self.moc.save()
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct EditSpendingCategory_Previews: PreviewProvider {
    static var previews: some View {
        EditSpendingCategory()
    }
}
