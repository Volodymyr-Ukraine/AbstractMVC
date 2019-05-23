//
//  LoginView.swift
//  LibMVC
//
//  Created by Vladimir on 5/12/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import UIKit
// import SnapKit
import LibMVC
import Styles

public enum LoginPresentationModelEvent {
    case didChange
}



public protocol LoginViewSubviews {
    var userNameTextField: UITextField {get}
    var userPasswordTextField: UITextField {get}
    var loginButton: UIButton {get}
    var registerButton: UIButton {get}
}

public protocol LoginView: RootView<LoginPresentationModel> {
    var eventHandler: EventHandler<LoginViewEvent>? { get set}
    
    var inLoading: Bool {get set}
    func setLoading(_ loading: Bool, animated: Bool)
}

public enum LoginViewEvent{
    case username(String?)
    case userpassword(String?)
    case login
    case register
}


public class LoginViewImpl: RootView<LoginPresentationModel>, LoginView, LoginViewSubviews {
    
    // MARK: -
    // MARK: Properties
    
    public let userNameTextField: UITextField = UITextField()
    public let userPasswordTextField: UITextField = UITextField()
    
    public let loginButton: UIButton = UIButton()
    public let registerButton: UIButton = UIButton()
    
    public var eventHandler: EventHandler<LoginViewEvent>?
    
    private let usernameAdapter: TextFieldAdapter
    private let passwordAdapter: TextFieldAdapter
    
    open override var content: [UIView] {
        var array = super.content
        array.append(contentsOf: self.textFields)
        return array
        //return super.content + self.textFields
    }
    
    public var textFields: [UITextField] {
        return [self.userNameTextField, self.userPasswordTextField]
    }
    
    public var inLoading: Bool = true // temporary value
    public func setLoading(_ loading: Bool, animated: Bool) {
        
    }
    
    // MARK: -
    // MARK:Init and Deinit
    
    public override init(model: LoginPresentationModel) {
        self.usernameAdapter = model.textFieldAdapter(textField: self.userNameTextField)
        self.passwordAdapter = model.textFieldAdapter(textField: self.userPasswordTextField)
        
        super.init(model: model)
        
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Open
    
    open override func configureDesign() {
        super.configureDesign()
        
        nameFormTextField(self.userNameTextField)
        passwordFormTextField(self.userPasswordTextField)
        
    }
    

    

    open override func configureBindings() {
        super.configureBindings()
        
        self.bindButtons()
        self.bindAdapters()
    }
    
    open override func configureLayouts() {
        super.configureLayouts()
    }
    
    // MARK: -
    // MARK: Actions
    
    @objc func didPressButton(_ sender: UIButton) {
        let handler = self.eventHandler
        switch sender {
            case self.loginButton: handler?(.login)
            case self.registerButton: handler?(.register)
        default: break
        }
    }
    
    open override func fill(from model: LoginPresentationModel) {
        super.fill(from: model)
        
        
        model.eventHandler = {[weak self] model in
            LibMVC.setup(self?.userNameTextField) {
                $0.placeholder = model.userNamePlaceholder
                $0.text = model.username
            }
            
            LibMVC.setup(self?.userPasswordTextField) {
                $0.placeholder = model.userPasswordPlaceholder
                $0.text = model.password
            }
        }
        model.style(self)
        model.layout(self)
    }
    
    // MARK: -
    // MARK: Private
    
    private func bindButtons() {
        [self.loginButton, self.registerButton].forEach{
            $0.addTarget(
                self,
                action: #selector(didPressButton),
                for: .touchUpInside
            )
        }
    }
    
    private func bindAdapters() {
        weak var weakSelf = self
        
        
        self.usernameAdapter.eventHandler = self.sendStringEvent(
                factory: LoginViewEvent.username,
                onReturn: { weakSelf?.userPasswordTextField.becomeFirstResponder() }
            )
            /*switch $0 {
            case let .text(string): weakSelf?.eventHandler?(.username(string))
            case .returnKey: weakSelf?.userPasswordTextField.becomeFirstResponder()
            } // */
        
        
        self.passwordAdapter.eventHandler = self.sendStringEvent(
                factory: LoginViewEvent.userpassword,
                onReturn: { weakSelf?.userPasswordTextField.resignFirstResponder() }
            )
    }
    
    private func sendStringEvent (factory: @escaping (String?) -> LoginViewEvent, onReturn: @escaping ()->()) -> (TextFieldEvent)->() {
        return { [weak self] in
            switch $0 {
            case let .text(string): self?.eventHandler?(factory(string))
            case .returnKey: onReturn()
            }
        }
    }
    
    
}
