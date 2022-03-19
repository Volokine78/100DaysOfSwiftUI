//
//  Expenses.swift
//  iExpense
//
//  Created by Tolga PIRTURK on 19.03.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
