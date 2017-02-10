//
//  IsValidTime.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation

class IsValidTime:Validator {

    func isValidField(field: ViewWrapper) -> Bool {
        let regExpression: String = "([01]?[0-9]|2[0-3]):[0-5][0-9]"
        let test = NSPredicate(format: "SELF MATCHES %@", regExpression)
        return test.evaluate(with: field.getText())
    }
    
    func getErrorMessage(field: ViewWrapper) -> String {
        return NSLocalizedString("invalid.error.time", comment: "")
    }
}
