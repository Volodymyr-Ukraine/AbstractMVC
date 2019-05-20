//
//  LoginModel.swift
//  LibMVC
//
//  Created by Vladimir on 5/12/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import UIKit
import LibMVC
import Styles

public class LoginModel: RootModel { // при необхідності можна зліпити з LoginPresentationModelImpl 
    public typealias Controler = LoginModel
    
    public typealias Presentation = LoginPresentationModel
    
    public typealias Assembly = LoginAssembly
    
    public var username: String?
    public var password: String?
    
    // MARK: -
    // MARK: Properties
    
    public var controler: LoginModel {
        return self}
    
    public let presentation : LoginPresentationModel
    
    public let assembly = LoginAssembly()
    
   
    // MARK: -
    // MARK: Init and Deinit
    
    public init (user: User) {
        self.username = user.email
        self.password = user.password
        self.presentation = LoginPresentationModelImpl(user: user)
    }
    
    // MARK: -
    // MARK: Public
    
    public func update(completion: ((User?, Bool)-> Void)) {
       self.username
            .flatMap{ username in
                self.password.flatMap {
                    self.assembly.user(username: username, password: $0)
                }
            }
            .do {
                completion($0, true)
            }
         // звертання на сервіси, обробка даних, звертання кудись ще
    }

}


