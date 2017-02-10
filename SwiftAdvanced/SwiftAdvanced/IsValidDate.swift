//
//  IsValidDate.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation

class IsValidDate:Validator {
    
    func isValidField(field: ViewWrapper) -> Bool {
        if field.getText().isEmpty { //Accept empty string
            return true
        }
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yyyy"
        let date: Date? = dateFormat.date(from: field.getText())
  
        //If date and date object is kind of NSDate class, then it must be a date produced by dateFormat.
        if date != nil {
            return true
        }
        return false
    }
    
    func getErrorMessage(field: ViewWrapper) -> String {
        return NSLocalizedString("invalid.error.date", comment: "")
    }
}
