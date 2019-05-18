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

