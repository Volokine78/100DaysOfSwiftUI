//
//  TimeConversionView.swift
//  UnitConverter
//
//  Created by Tolga PIRTURK on 5.01.2022.
//

import SwiftUI

struct TimeConversionView: View {
    @State private var inputAmount: Double = 0.0
    @State private var selectedInputUnitIndex = 0
    @State private var selectedOutputUnitIndex = 0
    @FocusState private var amountIsFocused: Bool
    
    let unitPairs: [(unitName: String, unitDuration: UnitDuration)] = [("Microseconds", .microseconds), ("Miliseconds", .milliseconds), ("Seconds", .seconds), ("Minutes", .minutes), ("Hours", .hours)]
    
    var inputMeasurement: Measurement<UnitDuration> {
        let selectedUnit = unitPairs[selectedInputUnitIndex].unitDuration
        let input = Measurement(value: inputAmount, unit: selectedUnit)
        return input
    }
    
    var outputMeasurement: Measurement<UnitDuration> {
        let selectedUnit = unitPairs[selectedOutputUnitIndex].unitDuration
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
            .navigationTitle("Time Conversions")
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

struct TimeConversionView_Previews: PreviewProvider {
    static var previews: some View {
        TimeConversionView()
    }
}
