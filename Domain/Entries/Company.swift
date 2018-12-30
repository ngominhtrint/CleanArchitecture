//
//  Company.swift
//  Domain
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Foundation

public struct Company: Codable {
    public let bs: String
    public let catchPhrase: String
    public let name: String
    
    public init(bs: String,
                catchPhrase: String,
                name: String) {
        self.bs = bs
        self.catchPhrase = catchPhrase
        self.name = name
    }
}

extension Company: Equatable {
    public static func == (lhs: Company, rhs: Company) -> Bool {
        return lhs.bs == rhs.bs &&
            lhs.catchPhrase == rhs.catchPhrase &&
            lhs.name == rhs.name
    }
}
