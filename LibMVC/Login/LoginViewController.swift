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
    

public class LoginViewController: RootViewController <LoginModel, LoginView, LoginAssembly> {
    
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
        self.rootView?.setLoading(true, animated: true)
        self.model.update {
            self.rootView?.setLoading(false, animated: true)
            
        }
    }
}
