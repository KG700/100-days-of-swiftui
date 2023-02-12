//
//  ContentView.swift
//  UnitConverter
//
//  Created by Karla Gardiner on 12/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var amountToConvert: Double = 0
    @State private var startingUnit = "meters"
    @State private var convertingUnit = "meters"
    @FocusState private var amountIsFocused: Bool
    
    var units: [String] = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var convertToMeters: Double {
        switch startingUnit {
        case "meters":
            return amountToConvert
        case "kilometers":
            return amountToConvert * 1000
        case "feet":
            return amountToConvert / 3.281
        case "yards":
            return amountToConvert / 1.094
        case "miles":
            return amountToConvert * 1609
        default:
            return amountToConvert
        }
    }
    
    var convertedAmount: Double {
        switch convertingUnit {
        case "meters":
            return convertToMeters
        case "kilometers":
            return convertToMeters / 1000
        case "feet":
            return convertToMeters * 3.281
        case "yards":
            return convertToMeters * 1.094
        case "miles":
            return convertToMeters / 1609
        default:
            return convertToMeters
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter amount to convert", value: $amountToConvert, format: .number).keyboardType(.decimalPad).focused($amountIsFocused)
                    Picker("Starting units", selection: $startingUnit) {
                        ForEach(units, id:\.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Amount to convert")
                }
                
                Section {
                    Text(convertedAmount, format: .number)
                    Picker("Starting units", selection: $convertingUnit) {
                        ForEach(units, id:\.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Converted amount")
                }

            }
            .navigationTitle("Unit Converter")
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
