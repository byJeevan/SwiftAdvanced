//
//  IsEmpty.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation

class IsEmpty:Validator {
    
    func isValidField(field: ViewWrapper) -> Bool {
        return field.getText().isEmpty == false
    }
    
    func getErrorMessage(field: ViewWrapper) -> String {
        return NSLocalizedString("invalid.error.empty", comment: "")
    }
}
