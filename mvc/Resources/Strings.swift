//
//  Strings.swift
//  mvc
//
//  Created by Vladimir on 5/18/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import Foundation

public enum Strings: String {
    case email
    case password
    
    // MARK: -
    // MARK: Properties
    
    public var value: String {
        return self.rawValue
    }
    
    public var uppercased: String {
        return self.value.uppercased()
    }
}
