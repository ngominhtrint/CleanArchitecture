//
//  Location.swift
//  Domain
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Foundation

public struct Location: Codable {
    public let latitude: Double
    public let longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Location: Equatable {
    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.latitude == rhs.latitude &&
            lhs.longitude == rhs.longitude
    }
}
