//
//  Indicator.swift
//  MVVMDesign
//
//  Created by Kushal Shrestha on 7/30/20.
//  Copyright © 2020 sthakushal. All rights reserved.
//

import SwiftUI

struct Indicator: UIViewRepresentable {
  
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
}
