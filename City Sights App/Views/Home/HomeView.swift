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
    @State var selectedBusiness: Business?
    
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
                            // Switch to map view button
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                        }
                        
                        Divider()
                        
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    // Show map
                    BusinessMap(selectedBusiness: $selectedBusiness)
                        .ignoresSafeArea()
                        .sheet(item: $selectedBusiness) { business in
                            // Create a business detail view instance, pass in selected business
                            BusinessDetail(business: business)
                        }
                    
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
