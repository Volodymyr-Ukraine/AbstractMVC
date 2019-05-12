//
//  LoginView.swift
//  LibMVC
//
//  Created by Vladimir on 5/12/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import Foundation
import SnapKit

public protocol LoginPresentationModel {
    var userNamePlaceholder: String? {get}
    var userPasswordPlaceholder: String? {get}
}

public class LoginView: RootView<LoginPresentationModel> {
    // MARK: -
    // MARK: Properties
    
    public let userName: UITextField = UITextField()
    public let userPassword: UITextField = UITextField()
    
    open override var content: [UIView] {
        return super.content + [self.userName, self.userPassword]
    }
    
    // MARK: -
    // MARK: Open
    
    open override func configureDesign() {
        super.configureDesign()
    }
    open override func configureLayouts() {
        super.configureLayouts()
    }
    
    open override func fill(from model: LoginPresentationModel) {
        super.fill(from: model)
        
        self.userName.placeholder = model.userNamePlaceholder
        self.userPassword.placeholder = model.userPasswordPlaceholder
    }
    
    
    
}
