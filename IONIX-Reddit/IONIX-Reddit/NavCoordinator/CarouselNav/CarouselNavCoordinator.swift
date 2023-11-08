//
//  CarouselNavCoordinator.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 5/11/23.
//

import Foundation
import SwiftUI

enum CarouselPage: String, Identifiable {
    case camera, notifications, location, home
    
    var id: String {
        self.rawValue
    }
}

class CarouselNavCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ page: CarouselPage) {
        path.append(page)
    }
    
    @ViewBuilder
    func build(page: CarouselPage) -> some View {
        switch page {
        case .camera:
            CameraAccessView(cameraAccessViewModel: CameraAccessViewModel())
        case .notifications:
            NotificationsAccessView(notificationsAccessViewModel: NotificationsAccessViewModel())
        case .location:
            LocationAccessView(locationAccessViewModel: LocationAccessViewModel())
        case .home:
            HomeFactory.create()
        }
    }
}
