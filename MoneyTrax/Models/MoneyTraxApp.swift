//
//  MoneyTraxApp.swift
//  MoneyTrax
//
//  Created by Joseph  DeWeese on 12/6/22.
//

import SwiftUI

@main
struct MoneyTraxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
