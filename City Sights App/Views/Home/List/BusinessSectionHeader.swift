//
//  BusinessSectionHeader.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/19/21.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
        }
        
    }
}
