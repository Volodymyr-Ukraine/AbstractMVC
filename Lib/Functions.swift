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
