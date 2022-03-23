//
//  Expenses.swift
//  iExpense
//
//  Created by Tolga PIRTURK on 19.03.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var personalItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }
    
    @Published var businessItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "PersonalItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                personalItems = decodedItems
                return
            }
        }
        personalItems = []
        
        if let savedItems = UserDefaults.standard.data(forKey: "BusinessItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                businessItems = decodedItems
                return
            }
        }
        businessItems = []
    }
}
