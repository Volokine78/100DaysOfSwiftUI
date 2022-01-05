//
//  VolumeConversionView.swift
//  UnitConverter
//
//  Created by Tolga PIRTURK on 5.01.2022.
//

import SwiftUI

struct VolumeConversionView: View {
    @State private var inputAmount: Double = 0.0
    @State private var selectedInputUnitIndex = 0
    @State private var selectedOutputUnitIndex = 0
    @FocusState private var amountIsFocused: Bool
    
    let unitPairs: [(unitName: String, unitVolume: UnitVolume)] = [("Centiliters", .centiliters), ("Deciliters", .deciliters), ("Liters", .liters), ("Kiloliters", .kiloliters), ("Megaliters", .megaliters), ("Gallons", .gallons)]
    
    var inputMeasurement: Measurement<UnitVolume> {
        let selectedUnit = unitPairs[selectedInputUnitIndex].unitVolume
        let input = Measurement(value: inputAmount, unit: selectedUnit)
        return input
    }
    
    var outputMeasurement: Measurement<UnitVolume> {
        let selectedUnit = unitPairs[selectedOutputUnitIndex].unitVolume
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
            .navigationBarTitle("Volume Conversions")
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

struct VolumeConversionView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeConversionView()
    }
}
