//
//  Home.swift
//  MVVMDesign
//
//  Created by Kushal Shrestha on 7/29/20.
//  Copyright © 2020 sthakushal. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var users = FetchAccounts()
    
    var body: some View {
        
        ZStack{
            if self.users.accounts.isEmpty{
                Indicator()
            } else {
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing:0) {
                        //
                        
                        ForEach(self.users.accounts) { users in
                            CardView(accountDetail: users)
                            
                        }
                    }
                }
            }
        }
            
            
        .onAppear{
            self.users.fetchUsers()
            
        }
        .navigationBarTitle("Home")
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
