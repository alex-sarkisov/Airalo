//
//  StoreViewModel.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import Foundation

protocol StoreViewModel {
    
}

class StoreViewModelImp: StoreViewModel {
    
    private let countryService: CountryService
    
    init(countryService: CountryService) {
        self.countryService = countryService
        obtainData()
    }
    
    private func obtainData() {
        Task {
            do {
                let countries = try await countryService.obtainPopularCountries()
            } catch {
                print(error)
            }
        }
    }
}
