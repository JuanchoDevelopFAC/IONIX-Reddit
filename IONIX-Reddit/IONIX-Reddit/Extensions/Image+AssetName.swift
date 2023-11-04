//
//  Image+AssetName.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 4/11/23.
//

import Foundation
import SwiftUI

enum AssetName: String {
    case splachScreen = "SplashScreen"
    
    var assetName: String {
        return self.rawValue
    }
}

extension Image {
    init(assetName: AssetName) {
        self.init(assetName.assetName)
    }
}
