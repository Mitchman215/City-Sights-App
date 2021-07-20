//
//  HomeView.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/19/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        if model.restaurants.count != 0 || model.sights.count != 0 {
            NavigationView {
                // Determine if we should show list or map
                if !isMapShowing {
                    // Show list
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            // TODO: determine location based off coords
                            Text("San Franciscco")
                            Spacer()
                            // TODO: convert to button once map view is made
                            Text("Switch to map view")
                        }
                        
                        Divider()
                        
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    // TODO: Show map
                    
                    // don't forget this
                    // .navigationBarHidden(true)
                }
            }
        }
        else {
            // Still waiting for data so show spinner
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
