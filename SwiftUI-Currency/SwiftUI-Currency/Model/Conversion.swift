//
//  Conversion.swift
//  SwiftUI-Currency
//
//  Created by Kushal Shrestha on 24/12/2020.
//

import SwiftUI

struct Conversion: Decodable {
    
    var rates: [String: Double]
    var date: String
    var base: String
}



