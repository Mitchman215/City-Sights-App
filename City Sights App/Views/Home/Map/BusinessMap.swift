//
//  BusinessMap.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/20/21.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    @Binding var selectedBusiness: Business?
    
    var locations:[MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        // Create a set of annotations from our list of businesses
        for business in model.restaurants + model.sights {
            
            // if the business has a lat/ long, create an MKPointAnnotation for it
            if let lat = business.coordinates?.latitude,
               let long = business.coordinates?.longitude {
                
                // Create a new annotation
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                // assign annotation to array
                annotations.append(a)
            }
        }
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        // declare that this view's coordinator is the mapView delegate
        mapView.delegate = context.coordinator
        
        // Make the user show up on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Add the annotations based on the business
        uiView.showAnnotations(self.locations, animated: true)
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    // MARK: - Coordinator class
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            // If the annotation is the user blue dot, return nil
            // without this, the blue dot representing the user is hidden
            if annotation is MKUserLocation {
                return nil
            }
            
            // Check if there is a reusable annotation view first
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
            
            if annotationView == nil { // couldn't get a reusable annotation view
                // Create a new annotation view
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            else {
                // Got a reusable annotation view
                annotationView!.annotation = annotation
            }
            
            // Return the annotation view
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            // User tapped on the annotation view
            
            // Get the business object that the annotation represents by
            // looping through businesses in the model and find a match
            for business in map.model.restaurants + map.model.sights {
                if business.name == view.annotation?.title {
                    // Set the selectedBusiness property to that business object
                    map.selectedBusiness = business
                    return
                }
            }
        }
        
    }
    
}
