//
//  TemperatureConversionView.swift
//  UnitConverter
//
//  Created by Tolga PIRTURK on 5.01.2022.
//

import SwiftUI

struct TemperatureConversionView: View {
    @State private var inputAmount: Double = 0.0
    @State private var selectedInputUnitIndex = 0
    @State private var selectedOutputUnitIndex = 0
    @FocusState private var amountIsFocused: Bool
    
    let unitPairs: [(unitName: String, unitTemperature: UnitTemperature)] = [("Celsius", .celsius), ("Fahrenheit", .fahrenheit), ("Kelvin", .kelvin)]
    
    var inputMeasurement: Measurement<UnitTemperature> {
        let selectedUnit = unitPairs[selectedInputUnitIndex].unitTemperature
        let input = Measurement(value: inputAmount, unit: selectedUnit)
        return input
    }
    
    var outputMeasurement: Measurement<UnitTemperature> {
        let selectedUnit = unitPairs[selectedOutputUnitIndex].unitTemperature
        let output = inputMeasurement.converted(to: selectedUnit)
        return output
    }
    
    var outputString: String {
        "\(outputMeasurement.value.formatted()) \(unitPairs[selectedOutputUnitIndex].unitName)"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount to convert", value: $inputAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("from unit", selection: $selectedInputUnitIndex) {
                        ForEach(0 ..< unitPairs.count) {
                            Text(self.unitPairs[$0].unitName)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert")
                }
                
                Section {
                    Picker("to unit", selection: $selectedOutputUnitIndex) {
                        ForEach(0 ..< unitPairs.count) {
                            Text(self.unitPairs[$0].unitName)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
                
                Section {
                    Text(outputString)
                } header: {
                    Text("Converted Value")
                }
            }
            .navigationTitle("Temperature Conversions")
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

struct TemperatureConversionView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureConversionView()
    }
}
