//
//  AddView.swift
//  iExpense
//
//  Created by Tolga PIRTURK on 20.03.2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currency = "USD"
    
    let types = ["Business", "Personal"]
    let currencies = ["USD", "EUR", "JPY", "TRY", "CAD", "CHF"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Currency Type", selection: $currency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .number)
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency)
                    
                    if item.type == "Personal" {
                        expenses.personalItems.append(item)
                        dismiss()
                    } else {
                        expenses.businessItems.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses()) 
    }
}
