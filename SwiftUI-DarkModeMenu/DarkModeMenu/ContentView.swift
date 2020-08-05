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
                    ZStack{
                        HStack{
                            Button(action: {
                                withAnimation(.default){
                                    self.showMode.toggle()
                                }
                            }){
                                Image("menu")
                                .resizable()
                                .frame(width: 25, height: 25)
                            }
                            Spacer()
                        }
                        Text("Home")
                    }
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1).shadow(radius: 3))
                    }
                    Spacer()
                    Text("Dark mode menu")
                    Spacer()
                }
             }
        HStack{
            
            Menu
                .preferredColorScheme(self.darkMode ? .dark : .light)
                .offset(x:self.showMode ? 0 : -UIScreen.main.bounds.width/1.5)
            Spacer(minLength: 0)
        }
        
        .background(Color.primary.opacity(self.showMode ?(self.darkMode ? 0.05 : 0.2): 0).edgesIgnoringSafeArea(.all))
        }
    }



struct Menu: View {
    @Binding var darkMode = Bool
    @Binding var showMode = Bool
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation(.default){
                        self.showMode.toggle()
                    }
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
            HStack(spacing:22){
                Image(systemName: "moon.fill ")
                    .font(.title)
                Text("Dark Mode")
                Spacer()
                Button(action:{
                    self.darkMode.toggle()
                    UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.darkMode ? .dark: .light
                }){
                    Image("off")
                        .font(.title)
                        .rotationEffect(.init(degrees: self.darkMode ? 180 :  0))
                }
            }
            .padding(.top, 25)
            Group{
                Button(action: {    }){
                    HStack(spacing: 22){
                        Image("story")
                        .resizable()
                        .frame(width: 25, height: 25)
                            .foregroundColor(.yellow)
                        Text("Story")
                        Spacer()
                    }
                }
                
                .padding(.top, 25)
                
                
                Button(action: {    }){
                                   HStack(spacing: 22){
                                       Image("chat")
                                       .resizable()
                                       .frame(width: 25, height: 28)
                                           .foregroundColor(.pink)
                                       Text("Chats")
                                    Spacer()
                                   }
                               }
                               
                               .padding(.top, 25)
                Divider()
                    .padding(.top,25)
                
                Button(action: {    }){
                                   HStack(spacing: 22){
                                       Image("media")
                                       .resizable()
                                       .frame(width: 25, height: 25)
                                           .foregroundColor(.purple)
                                       Text("Media and photo")
                                    Spacer()
                                   }
                               }
                               
                               .padding(.top, 25)
                
                Button(action: {    }){
                    HStack(spacing: 22){
                        Image("setting")
                        .resizable()
                        .frame(width: 25, height: 25)
                            .foregroundColor(.green)
                        Text("Setting and Privacy")
                     Spacer()
                    }
                }
                
                .padding(.top, 25)
                
                Button(action: {    }){
                    HStack(spacing: 22){
                        Image("help")
                        .resizable()
                        .frame(width: 25, height: 25)
                            .foregroundColor(.blue)
                        Text("Help Center")
                     Spacer()
                    }
                }
                
                .padding(.top, 25)
                
                Button(action: {    }){
                    HStack(spacing: 22){
                        Image("notification")
                        .resizable()
                        .frame(width: 25, height: 25)
                            .foregroundColor(.red)
                        Text("Notification")
                     Spacer()
                    }
                }
                
                .padding(.top, 25)
            }
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width/1.5)
        .background((self.darkMode ? Color.black : Color.white).edgesIgnoringSafeArea( .all))
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2))
    }
}
