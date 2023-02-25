//
//  Fonts.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

private enum FontStyle {
    case medium
    case regular
    case semiBold
    
    var fontName: String {
        switch self {
        case .medium: return "IBMPlexSans-Medium"
        case .regular: return "IBMPlexSans-Regular"
        case .semiBold: return "IBMPlexSans-SemiBold"
        }
    }
}

extension UIFont {
    
    static func medium(size: CGFloat) -> UIFont {
        return font(style: .medium, size: size)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return font(style: .regular, size: size)
    }
    
    static func semiBold(size: CGFloat) -> UIFont {
        return font(style: .semiBold, size: size)
    }
    
    private static func font(style: FontStyle, size: CGFloat) -> UIFont {
        return UIFont(name: style.fontName, size: size)!
    }
}
