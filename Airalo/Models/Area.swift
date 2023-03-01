//
//  Area.swift
//  Airalo
//
//  Created by Alex Sarkisov on 27.02.23.
//

import Foundation

typealias Country = Area

struct Area: Decodable {
    
    let id: Int
    let slug: String
    let title: String
    let image: ImageData
    let packages: [Package]?
}
