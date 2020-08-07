//
//  ContentView.swift
//  InstagramDesign
//
//  Created by Kushal Shrestha on 8/7/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Tabview()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Tabview: View {
    
    @State var index = 0
    @Environment(\.colorScheme) var scheme
    var colors = [Color("Color"), Color("Color1")]
    
    var body: some View{
        
        //tabview
        ZStack(alignment: .bottom){
            
            //changing view based on index
            
            if self.index == 0 {
                Home()
            } else if self.index == 1{
                Search()
                    // hiding the navigationbar
                    .navigationBarHidden(true)
                
            } else if self.index == 2{
                Notification()
                    .navigationBarHidden(true)
            } else {
                Profile()
                    .navigationBarHidden(true)
            }
            
            //tabview
            
            ZStack(alignment: .top){
                
                HStack(spacing: 0 ){
                    Button(action: {
                        self.index = 0
                    }){
                        Image("home")
                            .foregroundColor(self.index == 0 ? Color.primary : Color.primary.opacity(0.25))
                            .padding(.horizontal)
                    }
                    .padding(.trailing,30)
                    Button(action: {
                        self.index = 1
                    }){
                        Image("search")
                            .foregroundColor(self.index == 1 ? Color.primary : Color.primary.opacity(0.25))
                            .padding(.horizontal)
                    }
                    //for center space
                    
                    Spacer(minLength: 0)
                    
                    
                    Button(action: {
                        self.index = 2
                    }){
                        Image(systemName: "suit.heart.fill")
                            .font(.system(size:24))
                            .foregroundColor(self.index == 2 ? Color.primary : Color.primary.opacity(0.25))
                            .padding(.horizontal)
                    }
                    .padding(.trailing,30)
                    
                    Button(action: {
                        self.index = 3
                    }){
                        Image("profile")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 25, height: 24)
                            .clipShape(Circle())
                            .padding(.horizontal)
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top)
                //because  botton edge is ignore
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(self.scheme == .dark ? Color.black : Color.white)
                .clipShape(CShape())
                .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 0, y: -5)
                
                
                //button
                
                Button(action: {
                    
                }){
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                        .background(LinearGradient(gradient: .init(colors: self.colors), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(Circle())
                        .shadow(radius: 1)
                }
                
                //moving view up
                .offset(y: -24)
                
            }
        }
        
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y:rect.height ))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            // center curve
            path.addArc(center: CGPoint(x: rect.width/2, y: 0), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
            
        }
    }
}

struct Home:View {
    
    var colors = [Color("Color"), Color("Color1")]
    //to identfy dark mode
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                ScrollView(.horizontal, showsIndicators: false){
                    
                    
                    HStack(spacing: 15){
                        ZStack(alignment: .bottomTrailing){
                            Image("p1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 18))
                                .foregroundColor(.primary)
                        }
                        ForEach(2...8,id: \.self){i in
                            ZStack{
                                Image("p\(i)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                
                                //ring......
                                Circle()
                                    .stroke(AngularGradient(gradient: .init(colors: self.colors), center: .center), lineWidth: 3)
                                    .frame(width: 68, height: 68)
                            }
                            
                        }
                    }
                    
                    .padding()
                }
                .background(self.scheme == .dark ? Color.black : Color.white)
                .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 0, y: 5)
                
                // postView
                ForEach(data){ i in
                    PostView(postData: i)
                }
            }
            
            .padding(.bottom,110)
        }
        
        .navigationBarTitle("Instagram", displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            
        }, label: {
            Image("camera")
                .foregroundColor(.gray)
        }), trailing: NavigationLink(destination: Text("Send Message"), label: {
            Image("send")
                .foregroundColor(.gray )
        }))
    }
}

struct Search: View {
    var body: some View{
        GeometryReader{_ in
            
            VStack(){
                Text("Search")
            }
        }
    }
}

struct Notification: View {
    var body: some View{
        GeometryReader{_ in
            
            VStack{
                Text("Notification")
            }
        }
    }
}

struct Profile: View {
    var body: some View{
        GeometryReader{_ in
            
            VStack{
                Text("Profile")
            }
        }
    }
}


struct PostView: View{
    var postData: Post
    @State var comment = ""
    
    var body: some View{
        VStack(alignment: .leading){
            HStack(spacing: 12){
                Image(self.postData.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 6){
                    Text(self.postData.user)
                    Text(self.postData.time)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer(minLength: 0)
                Button(action:{
                    
                }){
                    Image("menu")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundColor(.gray )
                }
            }
            Image(self.postData.postImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 280)
                .cornerRadius(10)
                .padding(.vertical, 10)
            HStack(spacing: 20){
                Button(action: {
                    
                }){
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 24))
                        .foregroundColor(self.postData.liked ? .red : .gray)
                }
                
                
                Button(action: {
                    
                }){
                    Image( "send")
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }){
                    Image( "save")
                        .resizable()
                        .frame(width: 18, height: 22)
                        .foregroundColor(.gray)
                }
            }
            Text(self.postData.likes + " likes")
            Text(self.postData.postTitle)
                .padding(.top,5)
            
            Button(action: {
                
            }){
                Text("View all 78 comments")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 10)
            
            HStack(spacing:15){
                TextField("Add comment", text: self.$comment)
                    .font(.system(size:12))
                Button(action: {
                    
                }){
                    Image(systemName: "plus")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            .padding(.vertical,6)
            .background(Capsule().stroke(Color.gray,lineWidth: 1 ))
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

// Post Data..

struct Post : Identifiable {
    
    var id : Int
    var user : String
    var profile: String
    var postImage : String
    var postTitle : String
    var time : String
    var likes : String
    var liked : Bool
}

var data = [
    
    Post(id: 0, user: "Capcom", profile: "p1", postImage: "post1", postTitle: "New Resident Evil Village...", time: "24 min ago", likes: "1525", liked: true),
    
    Post(id: 1, user: "iJustine", profile: "profile", postImage: "post2", postTitle: "iPhone 11.....", time: "58 min ago", likes: "2562", liked: true),
    
    Post(id: 2, user: "Apple", profile: "p2", postImage: "post3", postTitle: "WWDC 2020 @ June 22", time: "1 hr ago", likes: "24568", liked: false),
    
    Post(id: 3, user: "Catherine", profile: "p4", postImage: "post4", postTitle: "Nice Day :)", time: "28 min ago", likes: "1925", liked: false),
    
    Post(id: 4, user: "UnBoxing", profile: "p5", postImage: "post5", postTitle: "New MacBook Pro Unbox...", time: "2 min ago", likes: "85669", liked: false),
]
