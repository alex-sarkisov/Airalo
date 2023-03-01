//
//  Color+Hex.swift
//  Airalo
//
//  Created by Alex Sarkisov on 28.02.23.
//

import SwiftUI

extension Color {
    
    static func hex(_ hex: String) -> Color {
        return Color(hex: hex)
    }
    
    init(hex: String) {
        let hexSanitized = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        
        var hexValue: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&hexValue) else {
            self.init(white: 0, opacity: 0)
            return
        }
        switch hexSanitized.count {
        case 6:
            self.init(hex6: UInt32(hexValue))
        default:
            self.init(white: 0, opacity: 0)
        }
    }
    
    init(hex6: UInt32, opacity: Double = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, opacity: opacity)
    }
}
