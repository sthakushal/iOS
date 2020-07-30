//
//  ContentView.swift
//  MapView
//
//  Created by Kushal Shrestha on 7/22/20.
//  Copyright © 2020 sthakushal. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        mapView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct mapView: UIViewRepresentable  {

    func makeCoordinator() -> mapView.Coordinator {
        return mapView.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<mapView>) -> MKMapView {
        let map = MKMapView()
        let sourceCoordinate = CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2707)
        let destinationCoordinate = CLLocationCoordinate2D(latitude: 12.9830, longitude: 80.2594)
        
        let region = MKCoordinateRegion(center: sourceCoordinate, latitudinalMeters: 100000, longitudinalMeters: 100000)
        
        map.region = region
        map.delegate = context.coordinator
        
        let destinationPin = MKPointAnnotation()
        
        destinationPin.coordinate = destinationCoordinate
        destinationPin.title = "Destination"
        map.addAnnotation(destinationPin)
        
        let sourcePin = MKPointAnnotation()
        sourcePin.coordinate = sourceCoordinate
               sourcePin.title = "Source"
               map.addAnnotation(sourcePin)
        
        
        let req = MKDirections.Request()
        
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
        
        let directions = MKDirections(request: req)
        directions.calculate  { (direct, err) in
            if err != nil {
                print((err?.localizedDescription) as Any)
                return
            }
                
            let polyline = direct?.routes.first?.polyline
            map.addOverlay(polyline!)
            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
            
        }
         
        
        return map
    }
    
    func updateUIView(_ uiView: mapView.UIViewType, context: UIViewRepresentableContext<mapView>) {
    }
    
    class Coordinator: NSObject,MKMapViewDelegate{
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let render = MKPolylineRenderer(overlay: overlay )
            render.strokeColor = .orange
            render.lineWidth = 2
            return render
        }
    }
}
