//
//  ViewConvertible.swift
//  LibMVC
//
//  Created by Vladimir on 5/18/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import Foundation

public protocol ViewConvertible: AnyObject {
    var view: UIView { get }
}

extension ViewConvertible where Self: UIView {
    public var view: UIView {
        return self}
}
