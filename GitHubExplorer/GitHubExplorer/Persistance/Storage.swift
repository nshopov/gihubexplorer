//
//  Storage.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 1.06.22.
//

import Foundation

public class Storage {
    public static let shared = Storage()
    private let userDefaults = UserDefaults.standard
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    private init() {}
    
    public func getObjectFor<T: Codable>(key: String) -> T? {
        var result: T? = nil
        if let rawData = self.userDefaults.object(forKey: key) as? Data{
            if let loadedObject = try? decoder.decode(T.self, from: rawData) {
                result = loadedObject
            }
        }
        return result
    }
    
    public func setObjectFor<T: Codable>(key: String, val: T) {
        if let encoded = try? encoder.encode(val) {
            self.userDefaults.set(encoded, forKey: key)
        }
    }
    
    public func removeObjectFor(key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
