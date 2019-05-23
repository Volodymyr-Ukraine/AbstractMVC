//
//  User.swift
//  LibMVC
//
//  Created by Vladimir on 5/18/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import Foundation
import LibMVC

public protocol User: AnyObject {
    var email: String {get}
    var password: String {get}
    var name: String? {get}
    
    var eventHandler: EventHandler<User>? {get set}
}
