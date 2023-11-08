//
//  IONIX_RedditApp.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 4/11/23.
//

import SwiftUI

@main
struct IONIX_RedditApp: App {
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "isFlowAccessCompleted") {
                HomeFactory.create()
            } else {
                CarouselNavCoordinatorView()
            }
        }
    }
}
