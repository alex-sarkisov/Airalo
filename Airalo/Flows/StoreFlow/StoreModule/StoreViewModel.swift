//
//  StoreViewModel.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import Foundation

class StoreViewModel: ObservableObject {
    
    @Published var isLoading: Bool = true
    @Published var selectedTab: StoreTab = .local
    @Published var localRowModels: [AreaRowModel] = []
    @Published var regionalRowModels: [AreaRowModel] = []
    
    private let countryService: CountryService
    private let regionService: RegionService
    
    init(countryService: CountryService, regionService: RegionService) {
        self.countryService = countryService
        self.regionService = regionService
        obtainData()
    }
    
    func onTapLocalArea(_ rowModel: AreaRowModel) {
        
    }
    
    func onTapRegionalArea(_ rowModel: AreaRowModel) {
        
    }
    
    private func obtainData() {
        Task {
            do {
                let countries = try await countryService.obtainPopularCountries()
                localRowModels = countries.map { .init(area: $0) }
                
                let regions = try await regionService.obtainRegions()
                regionalRowModels = regions.map { .init(area: $0) }
                
                let globalPackages = try await regionService.obtainGlobalPackages()
                isLoading = false
            } catch {
                isLoading = false
                print(error)
            }
        }
    }
}

enum StoreTab: Int, CaseIterable, Identifiable {
    case local
    case regional
    case global

    var id: Self {
        return self
    }
    
    var title: String {
        switch self {
        case .local:
            return "Local eSIMs"
        case .regional:
            return "Regional eSIMs"
        case .global:
            return "Global eSIMs"
        }
    }
}
