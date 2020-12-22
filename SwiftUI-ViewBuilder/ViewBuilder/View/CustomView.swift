//
//  CustomView.swift
//  ViewBuilder
//
//  Created by Kushal Shrestha on 22/12/2020.
//

import SwiftUI

struct CustomView<Content: View, Detail: View>: View {
    var content: Content
    var detail: Detail
    @Binding var colunms: [GridItem]
    
    init(colunms: Binding<[GridItem]>, @ViewBuilder content:() -> Content, @ViewBuilder detail:() -> Detail){
        self.content = content()
        self.detail = detail()
        self._colunms = colunms
    }
    
    var body: some View {
        if colunms.count == 1 {
            HStack(spacing:15){
                content
                detail
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
        }else {
            VStack {
                content
                detail
            }
            .padding(.horizontal)
        }
    }
}

