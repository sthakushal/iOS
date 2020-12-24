//
//  Currency.swift
//  SwiftUI-Currency
//
//  Created by Kushal Shrestha on 24/12/2020.
//

import SwiftUI

struct Currency: Identifiable {
   
    var id = UUID().uuidString
    var currencyName: String
    var currencyValue: Double
}


var currencies = ["USD","AUD","EUR","JPY"]
