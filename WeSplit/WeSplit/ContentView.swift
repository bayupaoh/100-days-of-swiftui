//
//  ContentView.swift
//  WeSplit
//
//  Created by Bayu Paoh on 24/01/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPrecentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]

    var amountTotal: Double {
        let tipSelection = Double(tipPercentages[tipPrecentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue

        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        let amoutPerPerson = amountTotal / peopleCount
        
        return amoutPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    
                    Picker("Tip Precentage", selection: $tipPrecentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amout Total")) {
                    Text("$ \(amountTotal, specifier: "%.2f")")
                }
                
                Section(header: Text("Amout per Person")) {
                    Text("$ \(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
