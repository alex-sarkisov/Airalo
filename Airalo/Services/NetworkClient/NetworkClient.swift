//
//  NetworkClient.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

protocol NetworkClient {

    func request(_ url: String) async throws -> Data
}

class NetworkClientImp: NetworkClient {
    
    private let session = URLSession.shared
    
    // MARK: - NetworkClient functions
    
    func request(_ url: String) async throws -> Data {
        guard let url = URL(string: url) else {
            throw NetworkClientError.invalidURL
        }
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw NetworkClientError.invalidServerResponse
        }
        if data.isEmpty {
            throw NetworkClientError.emptyData
        }
        return data
    }
}
