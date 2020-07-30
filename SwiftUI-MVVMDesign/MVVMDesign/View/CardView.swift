//
//  CardView.swift
//  MVVMDesign
//
//  Created by Kushal Shrestha on 7/30/20.
//  Copyright © 2020 sthakushal. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    var accountDetail: Account
    
    var body: some View {
        HStack(spacing: 15){
            AnimatedImage(url:URL(string: accountDetail.avatar_url))
            .resizable()
                .frame(width: 55, height: 55, alignment: .center)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 10){
                Text(self.accountDetail.login)
                Text("\(self.accountDetail.login) ")
                    .font(.caption)
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

