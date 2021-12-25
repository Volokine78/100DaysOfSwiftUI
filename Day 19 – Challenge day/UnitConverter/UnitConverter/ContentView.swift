//
//  ContentView.swift
//  UnitConverter
//
//  Created by Tolga PIRTURK on 25.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputAmount: Double = 0.0
    @State private var fromConversionIndex = 0
    @State private var toConversionIndex = 0
    @FocusState private var amountIsFocused: Bool

    let units: [(unitName: String, conversionRate: Double)] = [("mm", 0.001), ("m", 1.0), ("km", 1000), ("inch", 0.0254), ("foot", 0.3048), ("yard", 0.9144), ("mile", 1_609.344)]
    
    var unitAmount: Double {
        let unit = units[fromConversionIndex]
        return inputAmount * unit.conversionRate
    }
    
    var convertedAmount: Double {
        let unit = units[toConversionIndex]
        return unitAmount / unit.conversionRate
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount to convert", value: $inputAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("from unit", selection: $fromConversionIndex) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0].unitName)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert")
                }
                
                Section {
                    Picker("To unit", selection: $toConversionIndex) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0].unitName)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
                
                Section(header: Text("Converted value")) {
                    Text("\(convertedAmount.formatted())")
                }
            }
            .navigationBarTitle("Conversions")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
