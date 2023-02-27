//
//  CountryService.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

protocol CountryService {
    
    func obtainPopularCountries() async throws -> [Area]
}

struct CountryServiceImp: CountryService {
    
    let networkClient: NetworkClient
    
    private let decoder = JSONDecoder()
    
    func obtainPopularCountries() async throws -> [Area] {
        let data = try await networkClient.request(URLs.popularCountries)
        let countries = try decoder.decode([Area].self, from: data)
        return countries
    }
}

private extension CountryServiceImp {
    
    enum URLs {
        static let popularCountries = "https://www.airalo.com/api/v2/countries?type=popular"
    }
}
