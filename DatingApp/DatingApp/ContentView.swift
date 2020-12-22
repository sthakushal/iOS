//
//  ContentView.swift
//  DatingApp
//
//  Created by Kushal Shrestha on 8/16/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        loginView()
           // .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}


struct loginView: View{
    var body: some View{
        VStack{
            
            Spacer(minLength: 0)
            Image("logo")
                .padding(.horizontal,30)
                .padding(.vertical, 40)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
            
            VStack(spacing:4){
                HStack(spacing: 0){
                    Text("Dating")
                        .font(.system(size: 35, weight: .heavy))
                        .foregroundColor(.white)
                    Text("Match")
                        .font(.system(size: 35, weight: .heavy))
                        .foregroundColor(Color("txt"))
                }
                
                Text("lets choose your match")
                    .foregroundColor(Color.black.opacity(0.3))
                    .fontWeight(.heavy)
            }
            
            .padding(.top)
            
            Divider()
            Spacer(minLength: 0)
        }
        .background(LinearGradient(gradient: .init(colors: [Color("top"), Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))
    }
}
