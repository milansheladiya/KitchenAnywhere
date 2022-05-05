//
//  ContentView.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-05-04.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Important message"),
                message: Text("Wear sunscreen"),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
}

