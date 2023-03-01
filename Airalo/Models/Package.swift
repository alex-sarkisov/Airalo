//
//  Package.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

struct Package: Decodable {
    
    let id: Int
    let price: Double
    let title: String
    let data: String
    let validity: String
    let `operator`: Operator
}
