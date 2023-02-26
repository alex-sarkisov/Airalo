//
//  RegionService.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

protocol RegionService {
    
    func obtainRegions() async throws -> [Region]
}

struct RegionServiceImp: RegionService {
    
    let networkClient: NetworkClient
    
    private let decoder = JSONDecoder()
    
    func obtainRegions() async throws -> [Region] {
        let data = try await networkClient.request(URLs.regions)
        let regions = try decoder.decode([Region].self, from: data)
        return regions
    }
}

private extension RegionServiceImp {
    
    enum URLs {
        static let regions = "https://www.airalo.com/api/v2/regions"
    }
}
