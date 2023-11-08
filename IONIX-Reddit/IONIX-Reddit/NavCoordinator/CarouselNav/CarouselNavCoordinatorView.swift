//
//  CarouselNavCoordinatorView.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 5/11/23.
//

import SwiftUI

struct CarouselNavCoordinatorView: View {
    
    @StateObject private var carouselNavCoordinator = CarouselNavCoordinator()
    
    var body: some View {
        NavigationStack(path: $carouselNavCoordinator.path) {
            carouselNavCoordinator.build(page: .camera)
                .navigationDestination(for: CarouselPage.self, destination: { page in
                    carouselNavCoordinator.build(page: page)
                }
            )
        }
        .environmentObject(carouselNavCoordinator)
    }
}

#Preview {
    CarouselNavCoordinatorView()
}
