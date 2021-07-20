//
//  BusinessSection.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/19/21.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        Section (header: BusinessSectionHeader(title: title)) {
            ForEach(businesses) { business in
                BusinessRow(business: business)
            }
        }
    }
}
