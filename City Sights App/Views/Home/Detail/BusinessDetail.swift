//
//  BusinessDetail.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/20/21.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    @State private var showDirections = false
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            VStack (spacing: 0) {
                GeometryReader { geo in
                    // Business Image
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
                
                // Open / closed rectangle
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
            }
            
            // Business title and yelp attribution
            HStack {
                BusinessTitle(business: business)
                    .padding([.horizontal, .bottom])
                Spacer()
                YelpAttribution(link: business.url ?? "")
            }
            
            DashedDivider()
                .padding(.horizontal)
            
            // Phone
            HStack {
                Text("Phone: ")
                    .bold()
                Text(business.displayPhone ?? "")
                Spacer()
                Link("Call", destination: URL(string: "tel\(business.phone ?? "")")!)
            }
            .padding()
            
            DashedDivider()
                .padding(.horizontal)
            
            // Reviews
            HStack {
                Text("Reviews: ")
                    .bold()
                Text(String(business.reviewCount ?? 0))
                Spacer()
                Link("Read", destination: URL(string: "\(business.url ?? "")")!)
            }
            .padding()
            
            DashedDivider()
                .padding(.horizontal)
            
            // get directions button
            Button {
                // Show directions
                showDirections = true
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()
            .sheet(isPresented: $showDirections) {
                DirectionsView(business: business)
            }

            
        }
        
    }
}
