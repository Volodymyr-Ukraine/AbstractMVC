//
//  Optionals.swift
//  LibMVC
//
//  Created by Vladimir on 5/8/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import Foundation

public extension Optional {
    func `do` (_ action: (Wrapped) -> ()) {
        self.map(action)
    }
}
