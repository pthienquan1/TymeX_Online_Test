//
//  ContentView.swift
//  CurrencyExchange
//
//  Created by Phan Thien Quan on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationTitle("Currency Exchange")
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
