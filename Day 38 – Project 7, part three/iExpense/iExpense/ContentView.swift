//
//  ContentView.swift
//  iExpense
//
//  Created by Tolga PIRTURK on 19.03.2022.
//

import SwiftUI

struct AmountStyle: ViewModifier {
    var amount: Double
    
    func body(content: Content) -> some View {
        if amount < 10 {
            content
                .font(.body)
                .foregroundColor(.red)
        } else if amount < 100 {
            content
                .font(.body)
                .foregroundColor(.blue)
        } else if amount > 100 {
            content
                .font(.body)
                .foregroundColor(.green)
        }
    }
}

extension View {
    func amountStyle(with amount: Double) -> some View {
        modifier(AmountStyle(amount: amount))
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(expenses.personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: item.currency))
                                .amountStyle(with: item.amount)
                        }
                    }
                    .onDelete(perform: removePersonalItems)
                } header: {
                    Text("Personal")
                        .font(.headline)
                }
                
                Section {
                    ForEach(expenses.businessItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: item.currency))
                                .amountStyle(with: item.amount)
                        }
                    }
                    .onDelete(perform: removeBusinessItems)
                } header: {
                    Text("Business")
                        .font(.headline)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
