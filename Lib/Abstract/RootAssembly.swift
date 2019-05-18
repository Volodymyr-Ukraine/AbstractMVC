//
//  ControllerAssembly.swift
//  LibMVC
//
//  Created by Vladimir on 5/8/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import UIKit

public protocol RootAssembly {
    associatedtype Model
    associatedtype View: UIView//RootView<Model>
    
    
    func view(model: Model) -> View
    // var view: View {get}
}
