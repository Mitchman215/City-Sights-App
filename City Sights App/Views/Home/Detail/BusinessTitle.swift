//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/21/21.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Group {
                // Name of business
                Text(business.name!)
                    .font(.title2) 
                    .bold()
                    .padding(.vertical, 5)
                
                // Loop through display address
                if  business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { strLine in
                        Text(strLine)
                    }
                }
                
                // Rating
                Image("regular_\(business.rating ?? 0)")
                    .padding(.top, 5)
            }
        }
    }
}
