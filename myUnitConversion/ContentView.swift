//
//  ContentView.swift
//  myUnitConversion
//
//  Created by Muhammad Fahmi on 20/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var input: Double = 0
    @State private var userUnitInput = "meters"
    @State private var userUnitOutput = "km"
    @FocusState private var inputIsFocus: Bool
    let lengthUnit = ["meters", "km", "feet", "yard", "miles"]
    
    var conversionFactors: [String: Double] = [
        "meters_km": 0.001,
        "meters_feet": 3.28084,
        "meters_yard": 1.09361,
        "meters_miles": 0.000621371,
        "km_meters": 1000,
        "km_feet": 3280.84,
        "km_yard": 1093.61,
        "km_miles": 0.621371,
        "feet_meters": 0.3048,
        "feet_km": 0.0003048,
        "feet_yard": 0.333333,
        "feet_miles": 0.000189394,
        "yard_meters": 0.9144,
        "yard_km": 0.0009144,
        "yard_feet": 3,
        "yard_miles": 0.000568182,
        "miles_meters": 1609.34,
        "miles_km": 1.60934,
        "miles_feet": 5280,
        "miles_yard": 1760
    ]

    var output: Double {
        let conversionKey = "\(userUnitInput)_\(userUnitOutput)"
        
        if let conversionFactor = conversionFactors[conversionKey] {
            return input * conversionFactor
        } else {
            return input
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter number", value: $input, format: .number)
                        .keyboardType(.numberPad)
                        .focused($inputIsFocus)
                    Picker("", selection: $userUnitInput){
                        ForEach(lengthUnit, id: \.self){
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                } header: {
                    Text("Input unit")
                }
                
                Section{
                    Text(String(format: "%.2f", output)+" \(userUnitOutput)")
                    Picker("", selection: $userUnitOutput){
                        ForEach(lengthUnit, id: \.self){
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                } header: {
                    Text("Output unit")
                }
            }
            .navigationTitle("Unit Conversion")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Button("Done"){
                        inputIsFocus = false
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

// below is my way for the formula to work but it's bad bcs lots of if condition makes the code ugly
//var inputM: Bool{ userUnitInput == "meters" }
//var inputKM: Bool{ userUnitInput == "km" }
//var inputFT: Bool{ userUnitInput == "feet" }
//var inputYD: Bool{ userUnitInput == "yard" }
//var inputMI: Bool{ userUnitInput == "miles" }
//
//var outputM: Bool{ userUnitOutput == "meters" }
//var outputKM: Bool{ userUnitOutput == "km" }
//var outputFT: Bool{ userUnitOutput == "feet" }
//var outputYD: Bool{ userUnitOutput == "yard" }
//var outputMI: Bool{ userUnitOutput == "miles" }
//
//var output: Double{
//    var outputTemp = 0.0
//    if inputM {
//        if outputKM { outputTemp = input/1000
//        } else if outputFT {
//            outputTemp = input*3.28084
//        } else if outputYD {
//            outputTemp = input*1.09361
//        } else if outputMI {
//            outputTemp = input*0.000621371
//        } else { outputTemp = input }
//    } else if inputKM {
//        if outputM { outputTemp = input*1000
//        } else if outputFT {
//            outputTemp = input*3280.84
//        } else if outputYD {
//            outputTemp = input*1093.61
//        } else if outputMI {
//            outputTemp = input*0.621371
//        } else { outputTemp = input }
//    } else if inputFT {
//        if outputKM { outputTemp = input*0.0003048
//        } else if outputM {
//            outputTemp = input*0.3048
//        } else if outputYD {
//            outputTemp = input*0.333333
//        } else if outputMI {
//            outputTemp = input*0.000189394
//        } else { outputTemp = input }
//    } else if inputYD {
//        if outputKM { outputTemp = input*0.0009144
//        } else if outputFT {
//            outputTemp = input*3
//        } else if outputM {
//            outputTemp = input*0.9144
//        } else if outputMI {
//            outputTemp = input*0.000568182
//        } else { outputTemp = input }
//    } else if inputMI {
//        if outputKM { outputTemp = input*1.60934
//        } else if outputFT {
//            outputTemp = input*5280
//        } else if outputYD {
//            outputTemp = input*1760
//        } else if outputM {
//            outputTemp = input*1609.34
//        } else { outputTemp = input }
//    } else {
//        outputTemp = input
//    }
//    return outputTemp
//}
