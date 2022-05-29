//
//  ServiceLocator.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 27.05.22.
//

import Foundation


final class AppServiceLocator {
    
    // Singleton
    public static let shared = AppServiceLocator()
    
    private init() {}

    // Service registry
    private lazy var reg: Dictionary<String, Any> = [:]

    private func typeName(some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(typeName(some: some))"
    }

    func addService<T: Any>(service: T) {
        let key = typeName(some: T.self)
        reg[key] = service
    }

    func getService<T: Any>() -> T? {
        let key = typeName(some: T.self)
        return reg[key] as? T
    }
}
