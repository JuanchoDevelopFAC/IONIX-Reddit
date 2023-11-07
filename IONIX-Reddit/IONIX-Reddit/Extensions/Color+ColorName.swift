//
//  Color+ColorName.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 5/11/23.
//

import Foundation
import SwiftUI

enum ColorName: String {
    case orangeColor = "orange"
    case pinkColor = "pink"
    case grayLightColor = "grayLight"
    
    var colorName: String {
        return self.rawValue
    }
}

extension Color {
    init(colorName: ColorName) {
        self.init(colorName.colorName)
    }
}
