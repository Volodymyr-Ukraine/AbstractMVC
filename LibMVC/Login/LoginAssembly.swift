//
//  LoginAssembly.swift
//  LibMVC
//
//  Created by Vladimir on 5/12/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import UIKit
import LibMVC

public struct LoginAssembly: RootAssembly{
   
    public typealias View = LoginViewImpl
    
    public typealias Model = LoginPresentationModel
    
    public func view(model: Model) -> View {
        return LoginViewImpl(model: model)
    }
}
