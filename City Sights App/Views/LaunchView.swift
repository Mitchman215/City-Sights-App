//
//  ContentView.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/17/21.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // Detect the authorization status of geolocating user
        if model.authorizationState == .notDetermined {
            // If undetermined, show onboarding
        }
        else if model.authorizationState == .authorizedAlways ||
                    model.authorizationState == .authorizedWhenInUse {
            // If approved, show home view
            HomeView()
        }
        else {
            // If denied show denied view
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
