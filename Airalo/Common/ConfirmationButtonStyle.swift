//
//  ConfirmationButtonStyle.swift
//  Airalo
//
//  Created by Alex Sarkisov on 28.02.23.
//

import SwiftUI

struct ConfirmationButtonStyle: ButtonStyle {

    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .font(.semiBold(size: 11))
                .foregroundColor(color)
                .kerning(1)
                .padding(16)
                .offset(y: 1)
        }
        .frame(maxWidth: .infinity, minHeight: 44)
        .overlay(
            RoundedRectangle(cornerRadius: 7)
                .stroke(color, lineWidth: 1)
        )
    }
}
