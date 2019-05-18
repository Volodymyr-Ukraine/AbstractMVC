//
//  Functions.swift
//  LibMVC
//
//  Created by Vladimir on 5/8/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import Foundation

public func cast <Value, Result> (_ value: Value) -> Result? {
    return value as? Result
}

public func configure<Value> (_ value: Value, action: (inout Value) -> Void) -> Value {
    var data = value
    action(&data)
    return data
}

public func configure<Value> (_ value: Value?, action: (inout Value) -> Void) -> Value? {
    return value.map { configure($0, action: action)}
}


@discardableResult
public func setup<Value: AnyObject> (_ value: Value?, action: (Value) -> Void) -> Value? {
    return value.map {
        action($0)
        return $0
        
    }
}
