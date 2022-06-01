//
//  PersistanceTests.swift
//  GitHubExplorerTests
//
//  Created by Nikola Shopov on 1.06.22.
//

import Foundation
import XCTest


struct Dog: Codable {
    var name: String
    var age: Int
}

public class PersistanceTests: XCTestCase {
    
    public func testAddSampleObjectToPersistance() {
        if let loadedDog = Storage.shared.getObjectFor(key: "MyDog") as Dog? {
                print("Dog is set in the defaults")
                print("loaded dog: \(loadedDog)")
        } else {
            let myDog = Dog(name: "Rex", age: 1)
            Storage.shared.setObjectFor(key: "MyDog", val: myDog)
        }
        
        if (Storage.shared.getObjectFor(key: "MyDog") as Dog?) != nil {
            XCTAssertTrue(true)
        }
    }
}
