//
//  ContentView.swift
//  GridTabView
//
//  Created by Kushal Shrestha on 8/5/20.
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
    @State var index = 0
    
    
    var body: some View {
        VStack{
            HStack(){
                Text("STAT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            //tab view
            HStack( spacing: 0){
                Text("Day")
                    .foregroundColor(self.index == 0 ? .white : Color.purple.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal,35)
                    .background(Color.purple.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture{
                        withAnimation(.default){
                            
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                
                
                Text("Week")
                    .foregroundColor(self.index == 1 ? .white :  Color.purple.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal,35)
                    .background(Color.purple.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture{
                        withAnimation(.default){
                            
                            self.index = 1
                        }
                    }
                Spacer(minLength: 0)
                
                
                Text("Month")
                    .foregroundColor(self.index == 2 ? .white :  Color.purple.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal,35)
                    .background(Color.purple.opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture{
                        withAnimation(.default){
                            
                            self.index = 2
                        }
                    }
                Spacer(minLength: 0)
                
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal )
            .padding(.top,25)
            
            TabView(selection: self.$index){
                
                // week data..
                
                GridView(fitness_Data: fit_Data)
                    .tag(0)
                
                // month data...
                
                GridView(fitness_Data: week_Fit_Data)
                    .tag(1)
                
                VStack{
                    
                    Text("Monthly Data")
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer(minLength: 0)
        }
        .padding(.top)
    }
}


struct GridView: View {
    
    var fitness_Data : [Fitness]
    var colums = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View {
        
        LazyVGrid(columns: colums, spacing: 30){
            ForEach(fitness_Data){ fitness in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                    VStack(alignment: .leading , spacing:20){
                        Text(fitness.title)
                            .foregroundColor(.white)
                        Text(fitness.data)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                        
                        HStack{
                            
                            Spacer(minLength: 0)
                            
                            Text(fitness.suggest)
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding()
                    .background(Color.blue) //.background(Color(fitness.image))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2),radius: 5, x: 0, y:5)
                    
                    Image(fitness.image)
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.12))
                        .clipShape(Circle())
                    
                }
                
            }
        }
        .padding(.horizontal)
        .padding(.top, 25)
    }
}

// DashBoard Grid Model Data...

struct Fitness : Identifiable {
    
    var id : Int
    var title : String
    var image : String
    var data: String
    var suggest : String
}

// Daily Data...

var fit_Data = [
    
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "124 bpm", suggest: "80-120 Healthy"),
    
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "6h 43m", suggest: "Deep Sleep 5h 13m"),
    
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "583 kcal", suggest: "Daily Goal 900 kcal"),
    
    Fitness(id: 3, title: "Steps", image: "steps", data: "16,741", suggest: "Daily Goal 20,000 Steps"),
    
    Fitness(id: 4, title: "Running", image: "running", data: "5.3 km", suggest: "Daily Goal 10 km"),
    
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "15.3 km", suggest: "Daily Goal 20 km"),
]

// Monthly Data...

var week_Fit_Data = [
    
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "84 bpm", suggest: "80-120 Healthy"),
    
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "43h 23m", suggest: "Deep Sleep 26h 13m"),
    
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "3,500 kcal", suggest: "Weekly Goal 4,800 kcal"),
    
    Fitness(id: 3, title: "Steps", image: "steps", data: "17,8741", suggest: "Weekly Goal 25,0000 Steps"),
    
    Fitness(id: 4, title: "Running", image: "running", data: "45.3 km", suggest: "Weekly Goal 70 km"),
    
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "100.3 km", suggest: "Weekly Goal 125 km"),
]
