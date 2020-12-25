//
//  ContentView.swift
//  In-AppNotification
//
//  Created by Kushal Shrestha on 25/12/2020.
//

import SwiftUI
import UserNotifications

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
    @StateObject var delegate = NotificationDelegate()
    
    var body: some View {
        Button(action: createNotification, label: {
            Text("Notify User")
        })
        
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]){(_, _) in
            }
            UNUserNotificationCenter.current().delegate = delegate
        })
        .alert(isPresented: $delegate.alert, content: {
            Alert(title: Text("Message"), message: Text("Reply button is pressed"), dismissButton: .destructive(Text("Ok")))
        })
    }
    
    func createNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.subtitle = "Notification from in-app"
        
        content.categoryIdentifier = "ACTIONS"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "IN-APP", content: content, trigger: trigger)
        
        //Action
        let close = UNNotificationAction(identifier: "CLOSE", title: "Close", options: .destructive)
        let reply = UNNotificationAction(identifier: "REPLY", title: "Reply", options: .foreground)

        let category = UNNotificationCategory(identifier: "ACTIONS", actions: [close,reply], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
class NotificationDelegate: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    @Published var alert = false
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge,.banner,.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "REPLY"{
            print("reply the question")
            self.alert.toggle()
        }
        completionHandler()
    }
}
