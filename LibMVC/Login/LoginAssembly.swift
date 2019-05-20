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
    
    public func user (username: String, password: String) -> User {
        return UserClass(email: username, password: password)
        
    }
}

extension LoginAssembly {
    class UserClass: User {
        var email: String {
            didSet {self.send() }
        }
        
        var password: String{
            didSet {self.send() }
        }
        
        var name: String?{
            didSet {self.send() }
        }
        
        var eventHandler: EventHandler<User>?
        
        init(email: String, password: String) {
            self.email = email
            self.password = password
        }
        
        private func send() {
            self.eventHandler?(self)
        }
        
        
    }
}
