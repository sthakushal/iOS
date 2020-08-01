//
//  ContentView.swift
//  SwiftUI-CustomTabView
//
//  Created by Kushal Shrestha on 7/26/20.
//  Copyright © 2020 sthakushal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            Home()
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var index = 0
    
    var body: some View{
        VStack{
            TabView(selection: $index){
                Color.red
                    .tag(0)
                    .tabItem{
                        Image(systemName: "house.fill")
                }
                Color.black
                    .tag(1)
                    .tabItem{
                        Image(systemName: "person.fill")
                }
                Color.yellow
                    .tag(2)
                    .tabItem{
                        Image(systemName: "suit.heart.filll")
                }
                Color.blue
                    .tag(3)
                    .tabItem{
                        Image(systemName: "gear.fil")
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .tabViewStyle(PageTabViewStyle(backgroundDisplayMode: .always))
                
            .navigationBarItems(trailling: Menu (content: {
                
                Button(action: {
                    
                    withAnimation{
                        index = 0
                    }
                    
                }, label: {
                    
                    HStack{
                        Text("Home")
                        Image(systemName: "house.fill")
                    }
                })
                
                
                Button(action: {
                    
                    withAnimation{
                        index = 1
                    }
                    
                }, label: {
                    
                    HStack{
                        Text("Account")
                        Image(systemName: "person.fill")
                    }
                })
                
                
                Button(action: {
                    
                    withAnimation{
                        index = 2
                    }
                    
                }, label: {
                    
                    HStack{
                        Text("Loved")
                        Image(systemName: "suit.heart.fill")
                    }
                })
                
                
                Button(action: {
                    
                    withAnimation{
                        index = 3
                    }
                    
                }, label: {
                    
                    HStack{
                        Text("Setting")
                        Image(systemName: "gear.fill")
                    }
                })
                
                
            }, label: {
                Image(systemName: "line.horizontal.3")
            }))
        }
    }
}

