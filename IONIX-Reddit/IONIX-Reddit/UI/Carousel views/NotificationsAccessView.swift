//
//  NotificationsAccessView.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 5/11/23.
//

import SwiftUI

struct NotificationsAccessView: View {
    
    @ObservedObject private var notificationsAccessViewModel: NotificationsAccessViewModel
    @EnvironmentObject private var carouselNavCoordinator: CarouselNavCoordinator
    
    init(notificationsAccessViewModel: NotificationsAccessViewModel) {
        self.notificationsAccessViewModel = notificationsAccessViewModel
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            
            Image(assetName: .notificationsAccess)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            
            VStack(spacing: 10) {
                
                Text("Enable push notifications")
                    .font(.title)
                
                Text("Enable push notifications to let send you personal news and updates.")
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
            
            Button("Enable") {
                notificationsAccessViewModel.notificationsAccessPeticion()
            }
            .buttonStyle(RedditMainButton())
            
            Text("Cancel")
                .onTapGesture {
                    carouselNavCoordinator.push(.location)
                }
                .foregroundStyle(.gray)
                .padding(.horizontal, 5)
        }
        .navigationBarBackButtonHidden()
        .onReceive(notificationsAccessViewModel.$notificationsPermissionGranted) { value in
            if value {
                carouselNavCoordinator.push(.location)
            }
        }
    }
}
