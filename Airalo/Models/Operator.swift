//
//  Operator.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

struct Operator: Decodable {
    
    let id: Int
    let title: String
    let style: OperatorStyle
    let gradientStart: String
    let gradientEnd: String
    let image: ImageData
    let countries: [Area]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case style
        case gradientStart = "gradient_start"
        case gradientEnd = "gradient_end"
        case image
        case countries
    }
}
