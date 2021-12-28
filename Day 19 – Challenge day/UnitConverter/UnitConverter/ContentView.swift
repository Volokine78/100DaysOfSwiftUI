//
//  ContentView.swift
//  UnitConverter
//
//  Created by Tolga PIRTURK on 25.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputAmount: Double = 0.0
    @State private var selectedInputUnitIndex = 0
    @State private var selectedOutputUnitIndex = 0
    @FocusState private var amountIsFocused: Bool
    let measurementFormatter = MeasurementFormatter()
    
    let unitPairs: [(unitName: String, unitLength: UnitLength)] = [("mm", .millimeters), ("m", .meters), ("km", .kilometers), ("inch", .inches), ("foot", .feet), ("yard", .yards), ("mile", .miles)]
    
    var inputMeasurement: Measurement<UnitLength> {
        let selectedUnit = unitPairs[selectedInputUnitIndex].unitLength
        let input = Measurement(value: inputAmount, unit: selectedUnit)
        return input
    }
    
    var outputMeasurement: Measurement<UnitLength> {
        let selectedUnit = unitPairs[selectedOutputUnitIndex].unitLength
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
                            Text("\(self.unitPairs[$0].unitName)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert")
                }
                
                Section {
                    Picker("To unit", selection: $selectedOutputUnitIndex) {
                        ForEach(0 ..< unitPairs.count) {
                            Text("\(self.unitPairs[$0].unitName)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
                
                Section(header: Text("Converted value")) {
                    Text(outputString)
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
