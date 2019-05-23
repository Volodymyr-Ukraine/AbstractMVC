//
//  LoginViewController.swift
//  LibMVC
//
//  Created by Vladimir on 5/12/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import UIKit
import LibMVC
//public class LoginViewController: RootViewController <LoginModel, LoginView, LoginAssembly> {

public enum LoginViewControllerEvent {
    case didLogin(User?)
    case didRequestRegister
}

public class LoginViewController: RootViewController <LoginModel, LoginView, LoginAssembly> {
    
    // MARK: -
    // MARK: Properties
    
    var eventHandler: EventHandler<LoginViewControllerEvent>?
    
    // MARK: -
    // MARK: Open
    
    public override func configureBindings(view: LoginViewImpl) {
        super.configureBindings(view: view)
        
        view.eventHandler = { [weak self] in
            let model = self?.model
            switch $0 {
            case let .username(string): model?.username = string
            case let .userpassword(string): model?.password = string
            case .login: self?.login()
            case .register: break
            
            }
            
        }
    }
    
    public func login() {
        let setLoading: (Bool) -> Void = {
            self.rootView?.setLoading($0, animated: true)
        }
        
        setLoading(true)
        self.model.update { user, success in
            setLoading(false)
            self.eventHandler?(.didLogin(user))
            if !success {
                self.presentError()
            }
        }
    }
    // Розділяє навігацію від цього контролера (наприклад навігаційний контролер, координатор), який може створювати контролер реєстрації? а якщо користувач залогінився - викинув контролер реєстрації щоб повернувся користувач у вікно логіна
    public func presentError(){
        
    }
}
