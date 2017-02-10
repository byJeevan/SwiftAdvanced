//
//  IsPositiveNumber.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation

class IsPositiveNumber:Validator {
    
    func isValidField(field: ViewWrapper) -> Bool {
        let regExpression: String = "\\d+"
        let test = NSPredicate(format: "SELF MATCHES %@", regExpression)
        return test.evaluate(with: field.getText())
    }
    
    func getErrorMessage(field: ViewWrapper) -> String {
        return NSLocalizedString("invalid.error.number", comment: "")
    }
}
