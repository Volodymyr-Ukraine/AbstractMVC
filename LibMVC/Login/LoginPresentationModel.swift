//
//  LoginPresentationModel.swift
//  LibMVC
//
//  Created by Vladimir on 5/18/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import Foundation
import LibMVC
import Styles


public protocol LoginPresentationModel: AnyObject {
    var userNamePlaceholder: String? {get}
    var userPasswordPlaceholder: String? {get}
    
    var username: String? {get}
    var password: String? {get}
    
    var eventHandler: EventHandler<LoginPresentationModel>? { get set }
    
    var style: Style<LoginViewSubviews> {get}
    var layout: Style<LoginViewSubviews> {get}
    
    func textFieldAdapter(textField: UITextField) -> TextFieldAdapter // this must be a part of Assembly
}

public class LoginPresentationModelImpl: LoginPresentationModel {
    
    // MARK: -
    // MARK: Properties
    
    public let userNamePlaceholder: String?  = Strings.email.uppercased // may be included in "public let style"
    public let userPasswordPlaceholder: String? = Strings.password.uppercased
    
    public var username: String? {
        return self.user.email
    }
    public var password: String? {
        return self.user.password
    }
    
    public let style: Style<LoginViewSubviews> = {_ in } // may be changed from any class
    public let layout: Style<LoginViewSubviews> = {_ in }
    
    
    public var eventHandler: EventHandler<LoginPresentationModel>?
    
    private let user: User
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(user: User) {
        self.user = user
        
        user.eventHandler = { [weak self] _ in
            self.do { $0.eventHandler?($0) }
            
        }
    }
    
    // MARK: -
    // MARK: Public
    
    public func textFieldAdapter(textField: UITextField) -> TextFieldAdapter {
        return TextFieldAdapter(textField)
    }
    
    
}
