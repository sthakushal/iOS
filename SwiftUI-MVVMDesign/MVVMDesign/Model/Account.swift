//
//  Account.swift
//  MVVMDesign
//
//  Created by Kushal Shrestha on 7/29/20.
//  Copyright © 2020 sthakushal. All rights reserved.
//

import Foundation


struct Account: Identifiable, Decodable {
    var id: Int
    var login: String
    var avatar_url: String
}
