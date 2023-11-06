//
//  LocationAccessViewModel.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 5/11/23.
//

import Foundation
import CoreLocation

class LocationAccessViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

    @Published var locationPermissionGranted = false
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .authorizedWhenInUse:
                //Nav to home
                locationPermissionGranted = true
                break
            case .restricted, .denied:
                locationPermissionGranted = false
                break
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
                break
            default:
                locationPermissionGranted = false
                break
        }
    }
}
