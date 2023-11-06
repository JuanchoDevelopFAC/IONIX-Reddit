//
//  CameraAccessView.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 4/11/23.
//

import SwiftUI
import Combine

struct CameraAccessView: View {
    
    @EnvironmentObject private var carouselNavCoordinator: CarouselNavCoordinator
    @ObservedObject private var cameraAccessViewModel: CameraAccessViewModel
    
    init(cameraAccessViewModel: CameraAccessViewModel) {
        self.cameraAccessViewModel = cameraAccessViewModel
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            
            Image(assetName: .cameraAccess)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            
            VStack(spacing: 10) {
                
                Text("Camera Access")
                    .font(.title)
                
                Text("Please allow access to your camera to take photos")
                    .padding(
                        EdgeInsets(
                            top: 10,
                            leading: 70,
                            bottom: 0,
                            trailing: 70
                        )
                    )
                    .multilineTextAlignment(.center)
            }
            
            Button("Allow") {
                cameraAccessViewModel.cameraAccessPeticion()
            }
            .buttonStyle(RedditMainButton())
            
            Text("Cancel")
                .onTapGesture {
                    carouselNavCoordinator.push(.notifications)
                }
                .foregroundStyle(.gray)
                .padding(.horizontal, 5)
        }
        .onReceive(cameraAccessViewModel.$cameraPermissionGranted) { value in
            if value {
                carouselNavCoordinator.push(.notifications)
            }
        }
    }
}
