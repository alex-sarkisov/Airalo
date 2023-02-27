//
//  RegionService.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

protocol RegionService {
    
    func obtainRegions() async throws -> [Area]
    func obtainGlobalPackages() async throws -> Area
}

struct RegionServiceImp: RegionService {
    
    let networkClient: NetworkClient
    
    private let decoder = JSONDecoder()
    
    func obtainRegions() async throws -> [Area] {
        let data = try await networkClient.request(URLs.regions)
        let regions = try decoder.decode([Area].self, from: data)
        return regions
    }
    
    func obtainGlobalPackages() async throws -> Area {
        let data = try await networkClient.request(URLs.globalPackages)
        let region = try decoder.decode(Area.self, from: data)
        return region
    }
}

private extension RegionServiceImp {
    
    enum URLs {
        static let regions = "https://www.airalo.com/api/v2/regions"
        static let globalPackages = "https://www.airalo.com/api/v2/regions/world"
    }
}
