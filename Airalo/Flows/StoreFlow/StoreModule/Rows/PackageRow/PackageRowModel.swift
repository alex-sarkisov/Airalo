//
//  PackageRowModel.swift
//  Airalo
//
//  Created by Alex Sarkisov on 28.02.23.
//

import Foundation

struct PackageRowModel: Identifiable {
    let id: Int
    let package: Package
    let imageURL: URL?
    let gradientStartHex: String
    let gradientEndHex: String
    let title: String
    let subtitle: String
    let data: String
    let validity: String
    let buyButtonTitle: String
    let style: OperatorStyle
    
    init(package: Package) {
        self.id = package.id
        self.package = package
        self.imageURL = URL(string: package.operator.image.url)
        self.gradientStartHex = package.operator.gradientStart
        self.gradientEndHex = package.operator.gradientEnd
        self.title = package.operator.title
        let countries = package.operator.countries
        if countries.count == 1, let country = countries.first {
            self.subtitle = country.title
        } else {
            self.subtitle = "\(countries.count) Countries"
        }
        self.data = package.data
        self.validity = package.validity
        let format = package.price.truncatingRemainder(dividingBy: 1) == 0 ? "%.0f" : "%.2f"
        self.buyButtonTitle = String(format: "US$\(format) - BUY NOW", package.price)
        self.style = package.operator.style
    }
}
