//
//  ServiceFactory.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import Foundation

struct ServiceFactory {
    
    static func networkClient() -> NetworkClient {
        return NetworkClientImp()
    }
}
