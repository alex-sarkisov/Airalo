//
//  StoreViewModel.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import Foundation

protocol StoreModule: AnyObject {
    
    var onTapCountry: ((Country) -> Void)? { get set }
    var onTapRegion: ((Region) -> Void)? { get set }
}

class StoreViewModel: StoreModule, ObservableObject {
    
    // MARK: - Public properties
    
    @Published var isLoading: Bool = true
    @Published var selectedTab: StoreTab = .local
    @Published var localRowModels: [AreaRowModel] = []
    @Published var regionalRowModels: [AreaRowModel] = []
    @Published var globalRowModels: [PackageRowModel] = []
    @Published var alert: AlertDetails?
    
    // MARK: - StoreModule properties
    
    var onTapCountry: ((Country) -> Void)?
    var onTapRegion: ((Region) -> Void)?
    
    // MARK: - Private properties
    
    private let countryService: CountryService
    private let regionService: RegionService
    
    // MARK: - Public functions
    
    init(countryService: CountryService, regionService: RegionService) {
        self.countryService = countryService
        self.regionService = regionService
        obtainData()
    }

    func onTapLocalArea(_ rowModel: AreaRowModel) {
        onTapCountry?(rowModel.area)
    }
    
    func onTapRegionalArea(_ rowModel: AreaRowModel) {
        onTapRegion?(rowModel.area)
    }
    
    // MARK: - Private functions
    
    private func obtainData() {
        Task {
            do {
                let countries = try await countryService.obtainPopularCountries()
                let regions = try await regionService.obtainRegions()
                let globalPackages = try await regionService.obtainGlobalPackages()
                
                await MainActor.run {
                    localRowModels = countries.map { .init(area: $0) }
                    regionalRowModels = regions.map { .init(area: $0) }
                    globalRowModels = globalPackages.packages?.map { .init(package: $0) } ?? []
                    isLoading = false
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    handleError(error)
                }
            }
        }
    }
    
    private func handleError(_ error: Error) {
        if error.localizedDescription.isEmpty {
            alert = AlertDetails(title: "Oops, something went wrong", message: "Please try again later")
        } else{
            alert = AlertDetails(title: "Attention!", message: error.localizedDescription)
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
