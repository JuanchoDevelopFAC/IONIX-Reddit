//
//  RedditMainButton.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 4/11/23.
//

import Foundation
import SwiftUI

struct RedditMainButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 185, height: 50)
            .background(LinearGradient(
                gradient: Gradient(
                    colors: [Color(colorName: .pinkColor), Color(colorName: .orangeColor)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}
