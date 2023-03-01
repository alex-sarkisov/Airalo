//
//  Colors.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit
import SwiftUI

private enum ColorNames {
    
    static let background1 = "Background/background1"
    static let background2 = "Background/background2"
    
    static let content1 = "Content/content1"
    static let content2 = "Content/content2"
    static let content3 = "Content/content3"
}

extension UIColor {
    
    static var background1: UIColor { UIColor(named: ColorNames.background1)! }
    static var background2: UIColor { UIColor(named: ColorNames.background2)! }
    
    static var content1: UIColor { UIColor(named: ColorNames.content1)! }
    static var content2: UIColor { UIColor(named: ColorNames.content2)! }
    static var content3: UIColor { UIColor(named: ColorNames.content3)! }
}

extension Color {
    
    static var background1: Color { Color(ColorNames.background1) }
    static var background2: Color { Color(ColorNames.background2) }
    
    static var content1: Color { Color(ColorNames.content1) }
    static var content2: Color { Color(ColorNames.content2) }
    static var content3: Color { Color(ColorNames.content3) }
}
