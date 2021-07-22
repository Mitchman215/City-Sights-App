//
//  YelpAttribution.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/21/21.
//

import SwiftUI

struct YelpAttribution: View {
    
    var link: String
    
    var body: some View {
        
        if let url = URL(string: link) {
            Link(destination: url, label: {
                Image("yelp")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 36)
            })
        }
        
    }
}

struct YelpAttribution_Previews: PreviewProvider {
    static var previews: some View {
        YelpAttribution(link: "")
    }
}
