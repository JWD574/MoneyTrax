//
//  AddBudgetCategory.swift
//  MoneyTrax
//
//  Created by Joseph  DeWeese on 12/6/22.
//

import SwiftUI
import CoreData


struct AddBudgetCategoryView: View {
    //MARK:  PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var name: String = ""
    @State private var amount: String = ""
    
    var isFormValid: Bool {
        !name.isEmpty && !amount.isEmpty && amount.isNumeric && amount.isGreaterThan(0)
       
    }
    //MARK: SAVE FUNCTION
    private func saveBudgetCategory() {
        let budgetCategory = BudgetCategory(context: viewContext)
        budgetCategory.name = name
        budgetCategory.amount = Double(amount)!
        do{
            try viewContext.save()
              
        }catch{
            print(error)
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $name)
                    .foregroundColor(.primary)
                TextField("Amount", text: $amount).keyboardType(.decimalPad)
                    .foregroundColor(.primary)
            }.toolbar {
                ToolbarItem(placement:  .navigationBarTrailing) {
                    Button("Save"){
                        if isFormValid {
                            saveBudgetCategory()
                        }
                    }.disabled(!isFormValid)
                        .foregroundColor(.blue)
                }
                
            }
        }
    }
}

struct AddBudgetCategory_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView().environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
