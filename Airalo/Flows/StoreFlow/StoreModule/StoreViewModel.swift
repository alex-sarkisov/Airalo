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
    private let regionService: RegionService
    
    init(countryService: CountryService, regionService: RegionService) {
        self.countryService = countryService
        self.regionService = regionService
        obtainData()
    }
    
    private func obtainData() {
        Task {
            do {
                let countries = try await countryService.obtainPopularCountries()
                let regions = try await regionService.obtainRegions()
                let globalPackages = try await regionService.obtainGlobalPackages()
            } catch {
                print(error)
            }
        }
    }
}
