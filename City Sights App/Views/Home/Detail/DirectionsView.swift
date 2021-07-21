//
//  DirectionsView.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/21/21.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            HStack {
                // Business title
                BusinessTitle(business: business)
                
                Spacer()
                
                if let name = business.name?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                   let lat = business.coordinates?.latitude,
                   let long = business.coordinates?.longitude,
                   let url = URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name)") {
                    Link("Open in Maps", destination: url)
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            
            // Directions map
            DirectionsMap(business: business)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
