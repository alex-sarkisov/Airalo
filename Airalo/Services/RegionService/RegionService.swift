//
//  RegionService.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

protocol RegionService {
    
    func obtainRegions() async throws -> [Region]
    func obtainGlobalPackages() async throws -> Region
}

struct RegionServiceImp: RegionService {
    
    let networkClient: NetworkClient
    
    private let decoder = JSONDecoder()
    
    func obtainRegions() async throws -> [Region] {
        let data = try await networkClient.request(URLs.regions)
        let regions = try decoder.decode([Region].self, from: data)
        return regions
    }
    
    func obtainGlobalPackages() async throws -> Region {
        let data = try await networkClient.request(URLs.globalPackages)
        let region = try decoder.decode(Region.self, from: data)
        return region
    }
}

private extension RegionServiceImp {
    
    enum URLs {
        static let regions = "https://www.airalo.com/api/v2/regions"
        static let globalPackages = "https://www.airalo.com/api/v2/regions/world"
    }
}
