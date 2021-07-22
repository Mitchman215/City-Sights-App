//
//  OnboardingView.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/21/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        VStack {
            
            // Tab View
            TabView(selection: $tabSelection) {
                
                // First tab
                TabViewItem(imageStr: "city2",
                            bigText: "Welcome to City Sights!",
                            smallText: "City Sights helps you find the best of the city!")
                    .tag(0)
                
                // Second tab
                TabViewItem(imageStr: "city1",
                            bigText: "Ready to discover your city?",
                            smallText: "We'll show you the best restaurants, venues, and more based on your location!")
                    .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            // Button
            Button {
                if tabSelection == 0 {
                    tabSelection = 1
                }
                else {
                    // Request for geolocation permission
                    model.requestGeolocationPermission()
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next" : "Get my location")
                        .bold()
                        .padding()
                }
            }
            .accentColor(tabSelection == 0 ? blue : turquoise)
            .padding()
            .padding(.bottom, 20)

            Spacer()
        }
        .background(tabSelection == 0 ? blue : turquoise)
        .ignoresSafeArea()
    }
}

private struct TabViewItem: View {
    
    var imageStr: String
    var bigText: String
    var smallText: String
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            Image(imageStr)
                .resizable()
                .scaledToFit()
            
            Text(bigText)
                .bold()
                .font(.title)
            
            Text(smallText)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .padding()
    }
    
}
