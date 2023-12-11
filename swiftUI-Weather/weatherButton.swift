//
//  weatherButton.swift
//  swiftUI-Weather
//
//  Created by Sawaiz Naveed on 12/11/23.
//

import Foundation
import SwiftUI

struct weatherButton: View {
    var buttonTitle: String
    var foregroundColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(buttonTitle)
            .foregroundStyle(Color(foregroundColor))
            .frame(width: 200, height: 40)
            .background(Color(backgroundColor))
            .cornerRadius(6)
            .font(.system(size: 20, weight: .bold))
    }
}

