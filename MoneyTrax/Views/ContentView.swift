//
//  ContentView.swift
//  MoneyTrax
//
//  Created by Joseph  DeWeese on 12/6/22.
//

import SwiftUI


struct ContentView: View {
    //MARK:  PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) private var budgetCategoryResults:  FetchedResults<BudgetCategory>
    
    @State private var isPresented: Bool = false
    
    
    var body: some View {
        NavigationStack {
            List(budgetCategoryResults) { budgetCategory in
                HStack {
                    Text(budgetCategory.name ?? "")
                    Spacer()
                    Text(budgetCategory.amount as NSNumber, formatter:
                            NumberFormatter.currency)
                }
            }
        }
     
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add New Category") {
                    isPresented = true
                }
            }
        
        }.sheet(isPresented: $isPresented) {
            AddBudgetCategoryView()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView().environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
