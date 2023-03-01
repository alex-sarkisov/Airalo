//
//  CountryService.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

protocol CountryService {
    
    func obtainPopularCountries() async throws -> [Country]
    func obtainCountryPackages(slug: String) async throws -> Country
}

struct CountryServiceImp: CountryService {
    
    let networkClient: NetworkClient
    
    private let decoder = JSONDecoder()
    
    func obtainPopularCountries() async throws -> [Country] {
        let data = try await networkClient.request(URLs.popularCountries)
        let countries = try decoder.decode([Country].self, from: data)
        return countries
    }
    
    func obtainCountryPackages(slug: String) async throws -> Country {
        let data = try await networkClient.request(URLs.countryPackages + slug)
        let country = try decoder.decode(Country.self, from: data)
        return country
    }
}

private extension CountryServiceImp {
    
    enum URLs {
        static let popularCountries = "https://www.airalo.com/api/v2/countries?type=popular"
        static let countryPackages = "https://www.airalo.com/api/v2/countries/"
    }
}
