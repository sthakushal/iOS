//
//  ContentView.swift
//  DarkModeMenu
//
//  Created by Kushal Shrestha on 7/30/20.
//  Copyright © 2020 sthakushal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    
    @State var darkMode = false
    @State var showMode = false
     
    var body: some View{
        ZStack(alignment: .leading ){
            GeometryReader {_ in
                
                VStack{
                    Text("Dark mode menu")
                }
             }
            
            Menu(dark: self.$darkMode, show: self.$showMode)
        }
    }
}


struct Menu: View {
    @Binding var darkMode = Bool
    @Binding var showMode = Bool
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    
                }){
                    Image("back")
                    .resizable()
                    .frame(width: 12, height: 20)
                }
                
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "square.and.pencil").font(.system(size: 16, weight: .bold))
                }
            }
            .padding(.top)
            .padding(.bottom, 25)
            
            Image("pic")
            .resizable()
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            
            VStack(spacing: 12){
                Text("John")
                Text("Developer")
                    .font(.caption)
            }
            . padding(.top, 25)
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width/1.5)
        .background((self.darkMode ? Color.black : Color.white).edgesIgnoringSafeArea( .all))
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2))
    }
}
