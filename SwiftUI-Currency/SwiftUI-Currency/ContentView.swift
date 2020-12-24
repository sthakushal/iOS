//
//  ContentView.swift
//  SwiftUI-Currency
//
//  Created by Kushal Shrestha on 24/12/2020.
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
