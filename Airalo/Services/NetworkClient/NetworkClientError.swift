//
//  NetworkClientError.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

enum NetworkClientError: Error {
    case invalidURL
    case invalidServerResponse
    case emptyData
}
