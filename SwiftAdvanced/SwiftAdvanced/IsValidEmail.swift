//
//  IsValidEmail.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation

class IsValidEmail:Validator {
    
    func isValidField(field: ViewWrapper) -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: field.getText())
    }
    
    func getErrorMessage(field: ViewWrapper) -> String {
        return NSLocalizedString("invalid.error.email", comment: "")
    }
}
