//
//  BusinessDetail.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/20/21.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    
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
            
            
            Group {
                // Name of business
                Text(business.name!)
                    .font(.title)
                    .bold()
                    .padding(.vertical, 5)
                    
                
                // Loop through display address
                if  business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { str in
                        Text(str)
                    }
                }
                
                // Rating
                Image("regular_\(business.rating ?? 0)")
            }
            .padding(.horizontal)
            
            Divider()
            
            // Phone
            HStack {
                Text("Phone: ")
                    .bold()
                Text(business.displayPhone ?? "")
                Spacer()
                Link("Call", destination: URL(string: "tel\(business.phone ?? "")")!)
            }
            .padding()
            
            Divider()
            
            // Reviews
            HStack {
                Text("Reviews: ")
                    .bold()
                Text(String(business.reviewCount ?? 0))
                Spacer()
                Link("Read", destination: URL(string: "\(business.url ?? "")")!)
            }
            .padding()
            
            Divider()
            
            // get directions button
            Button {
                // TODO: Show directions
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

            
        }
        
    }
}
