//
//  Country.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

struct Country: Decodable {
    
    let id: Int
    let slug: String
    let title: String
    let image: ImageData
}