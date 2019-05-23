//
//  View.swift
//  LibMVC
//
//  Created by Vladimir on 5/18/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import Foundation

public protocol View: ViewConvertible {
    associatedtype Model
    
    var model: Model { get }
}
