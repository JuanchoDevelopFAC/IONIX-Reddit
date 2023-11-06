//
//  LocationAccessView.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 5/11/23.
//

import SwiftUI
import CoreLocation

struct LocationAccessView: View {
    
    @ObservedObject private var locationAccessViewModel: LocationAccessViewModel
    @EnvironmentObject private var carouselNavCoordinator: CarouselNavCoordinator
    
    init(locationAccessViewModel: LocationAccessViewModel) {
        self.locationAccessViewModel = locationAccessViewModel
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            
            Image(assetName: .locationAccess)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            
            VStack(spacing: 10) {
                
                Text("Enable location services")
                    .font(.title)
                
                Text("We wants to access your location only to provide a better experience by helping you find new friends nearby.")
                    .padding(
                        EdgeInsets(
                            top: 10,
                            leading: 60,
                            bottom: 0,
                            trailing: 60
                        )
                    )
                    .multilineTextAlignment(.center)
            }
            
            Button("Enable") {
                
            }
            .buttonStyle(RedditMainButton())
            
            Text("Cancel")
                .foregroundStyle(.gray)
                .padding(.horizontal, 5)
        }
        .navigationBarBackButtonHidden()
        .onReceive(locationAccessViewModel.$locationPermissionGranted) { value in
            if value {
                print("NAV TO HOME")
            }
        }
    }
}
