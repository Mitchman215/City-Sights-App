//
//  CitySightsApp.swift
//  City Sights App
//
//  Created by Mitchell Salomon on 7/17/21.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
