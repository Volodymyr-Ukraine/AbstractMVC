//
//  RootViewGettable.swift
//  LibMVC
//
//  Created by Vladimir on 5/8/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import UIKit

public protocol RootViewGettable {
    associatedtype RootViewType
    associatedtype View
    
    var viewIfLoaded: UIView? {get}
    var rootView: RootViewType? {get} // extended in extention
}

public extension RootViewGettable {
    var rootView: RootViewType? {
        return self.viewIfLoaded.flatMap(cast)
    }
    
}
