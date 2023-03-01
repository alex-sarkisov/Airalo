//
//  AlertDetails.swift
//  Airalo
//
//  Created by Alex Sarkisov on 01.03.23.
//

import Foundation

struct AlertDetails: Identifiable {
    var id: String { title }
    let title: String
    let message: String
}
