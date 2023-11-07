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
            //CarouselNavCoordinatorView()
            HomeFactory.create()
        }
    }
}
