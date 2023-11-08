//
//  CameraAccessViewModel.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 5/11/23.
//

import Foundation
import AVKit

class CameraAccessViewModel: ObservableObject {
        
    @Published var cameraPermissionGranted = false
    
    func cameraAccessPeticion() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    self.cameraPermissionGranted = granted
                }
            }
        case .restricted:
            self.cameraPermissionGranted = false
        case .denied:
            self.cameraPermissionGranted =  false
        case .authorized:
            self.cameraPermissionGranted =  true
        @unknown default:
            fatalError()
        }
    }
}
