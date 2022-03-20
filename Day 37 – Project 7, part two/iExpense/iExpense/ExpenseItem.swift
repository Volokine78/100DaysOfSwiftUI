//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Tolga PIRTURK on 19.03.2022.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
