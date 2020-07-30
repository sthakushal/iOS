//
//  FetchAccount.swift
//  MVVMDesign
//
//  Created by Kushal Shrestha on 7/29/20.
//  Copyright © 2020 sthakushal. All rights reserved.
//

import Foundation
import SwiftUI

class FetchAccounts: ObservableObject {
    @Published var accounts: [Account] = []
    
    let url = "https://api.github.com/users/hadley/orgs"
    
    func fetchUsers(){
        let urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: URL(string: url)!){(data, _, _) in
            guard let users = data else {return}
            
            do {
                let decoder = try JSONDecoder().decode([Account].self, from: users)
                print(decoder )
                
                DispatchQueue.main.async {
                    self.accounts = decoder 
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    .resume()
    }
}
