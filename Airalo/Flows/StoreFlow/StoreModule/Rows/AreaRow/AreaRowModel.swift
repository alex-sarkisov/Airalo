//
//  AreaRowModel.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

struct AreaRowModel: Identifiable {
    let id: Int
    let area: Area
    let imageURL: URL?
    let title: String
    
    init(area: Area) {
        self.id = area.id
        self.area = area
        self.imageURL = URL(string: area.image.url)
        self.title = area.title
    }
}
