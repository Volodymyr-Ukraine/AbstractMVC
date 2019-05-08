//
//  File.swift
//  mvc
//
//  Created by Vladimir on 5/5/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import UIKit

public protocol RootModel{
    associatedtype Controler // means Controler of this RootModel and other names - the same
    associatedtype Presentation
    associatedtype Assembly
    
    var controler: Controler { get }
    var presentation: Presentation { get }
    var assembly: Assembly { get }
}
