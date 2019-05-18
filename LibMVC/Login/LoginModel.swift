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

public class LoginModel: RootModel, LoginPresentationModel { // при необхідності можна розділити цю модель на чисту модель та модель представлення (поки через мале наповнення їх злито докупи
    public typealias Controler = LoginModel
    
    public typealias Presentation = LoginPresentationModel
    
    public typealias Assembly = LoginAssembly
    
    
    // MARK: -
    // MARK: Properties
    
    public var controler: LoginModel {
    return self}
    
    public var presentation : LoginPresentationModel {
        return self
    }
    public let assembly = LoginAssembly()
    
    public let userNamePlaceholder: String?  = Strings.email.uppercased
    public let userPasswordPlaceholder: String? = Strings.password.uppercased
    
    public var username: String? {
        return nil
    }
    public var password: String? {
        return nil
    }
    
    public let style: Style<LoginViewSubviews> = {_ in }
    public let layout: Style<LoginViewSubviews> = {_ in }
    
    
    public var eventHandler: EventHandler<LoginPresentationModel>?
    
    // MARK: -
    // MARK: Public
    
    public func textFieldAdapter(textField: UITextField) -> TextFieldAdapter {
        return TextFieldAdapter(textField)
    }
}
