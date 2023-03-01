//
//  PackagesViewModel.swift
//  Airalo
//
//  Created by Alex Sarkisov on 28.02.23.
//

import Foundation

class PackagesViewModel: ObservableObject {
    
    let navigationTitle: String
    
    @Published var isLoading: Bool = true
    @Published var packageRowModels: [PackageRowModel] = []
    @Published var alert: AlertDetails?
    
    private let area: Area
    private let areaType: AreaType
    private let countryService: CountryService
    private let regionService: RegionService
    
    init(area: Area, areaType: AreaType, countryService: CountryService, regionService: RegionService) {
        self.area = area
        self.areaType = areaType
        self.countryService = countryService
        self.regionService = regionService
        self.navigationTitle = area.title
        obtainData()
    }
    
    private func obtainData() {
        Task {
            do {
                let areaPackages: Area
                switch areaType {
                case .country:
                    areaPackages = try await countryService.obtainCountryPackages(slug: area.slug)
                case .region:
                    areaPackages = try await regionService.obtainRegionPackages(slug: area.slug)
                }
                await MainActor.run {
                    packageRowModels = areaPackages.packages?.map { .init(package: $0) } ?? []
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
