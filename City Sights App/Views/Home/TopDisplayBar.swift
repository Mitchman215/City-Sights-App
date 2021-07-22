//
//  TopDisplayBar.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/20/21.
//

import SwiftUI

struct TopDisplayBar: View {
    
    @EnvironmentObject var model: ContentModel
    @Binding var isMapShowing: Bool
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .frame(height: 48)
            
            HStack {
                Image(systemName: "location")
                // Display city based off coords
                Text(model.placemark?.locality ?? "")
                Spacer()
                // Switch to map view button
                Button("Switch to \(isMapShowing ? "list" : "map") view") {
                    self.isMapShowing.toggle()
                }
            }
            .padding()
        }
    }
}
