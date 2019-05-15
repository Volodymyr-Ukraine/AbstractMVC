//
//  File.swift
//  Styles
//
//  Created by Vladimir on 5/14/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import UIKit

// MARK: -
// MARK: Infix

precedencegroup Composition {
    associativity: left
}

infix operator +: Composition

public typealias Style<Type: UIView> = (Type) -> Void
public func + <Type: UIView> (lhs: @escaping Style<Type>, rhs: @escaping Style<Type>) -> Style<Type> {
    return { value in
            [lhs,rhs].forEach{ $0(value)}
        }
}// */
/*public func + <Type: [UIView]> (lhs: [Type], rhs: [Type]) -> [Type] {
    var array = lhs
    array.append(contentsOf: rhs)
    return array
} // */
/*public func + <Type> (lhs: @escaping Style<Type>, rhs: @escaping Style<Type>) -> Style<Type> {
    return {
        lhs($0)
        rhs($0)
    }
} // */

// MARK: -
// MARK: Functions

public func textFont(_ font: UIFont) -> (UITextField) -> () {
    return {$0.font = font}
}

public func textColor(_ color: UIColor) -> (UITextField) -> () {
    return {$0.textColor = color}
}

public func isSecureTextEntry(_ secure: Bool) -> (UITextField) -> () {
    return {$0.isSecureTextEntry = secure}
}

public func returnKeyType(_ type: UIReturnKeyType) -> (UITextField) -> () {
    return {$0.returnKeyType = type}
}

public func autoCapitalisedText(_ isCapitalised: UITextAutocapitalizationType) -> (UITextField) -> () {
    return {$0.autocapitalizationType = isCapitalised}
}

// MARK: -
// MARK: Style constants

public let largeFont = textFont(UIFont.systemFont(ofSize: 18))
public let darkGrayColor = textColor(UIColor.darkGray)
public let returnKeyNext = returnKeyType(.next)
public let nonAutoCapitalised = autoCapitalisedText(UITextAutocapitalizationType.none)

// MARK: -
// MARK: Style group fields

public let textField = largeFont + darkGrayColor
public let nameFormTextField = textField + returnKeyNext + nonAutoCapitalised
public func uglyTextField(_ textField: UITextField) {
    largeFont(textField)
    darkGrayColor(textField)
}

public let passwordFormTextField = textField + isSecureTextEntry(true) + returnKeyType(.done)

