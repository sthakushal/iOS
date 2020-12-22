//
//  ContentView.swift
//  ViewBuilder
//
//  Created by Kushal Shrestha on 22/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .padding()
                .navigationTitle("View Builder")
                .preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
