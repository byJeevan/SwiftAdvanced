//
//  IsValidLength.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//
import Foundation

class IsValidLength:Validator {
    
    var minLength: Int = -1
    var maxLength: Int = -1
    
    convenience init(minLength min: Int, andMaxLength max: Int) {
        self.init()
        self.minLength = min
        self.maxLength = max
    }
    
    convenience init(minLength min: Int) {
        self.init(minLength: min, andMaxLength: -1)
    }
    
    convenience init(maxLength max: Int) {
        self.init(minLength: -1, andMaxLength: max)
    }
    
    func isValidField(field: ViewWrapper) -> Bool {
        var value: String = field.getText()
        if value.characters.count  == 0 {
            return false
        }
        if self.minLength > 0 && self.maxLength > 0 {
            return value.characters.count  >= self.minLength && value.characters.count <= self.maxLength
        }
        if self.minLength > 0 && self.maxLength < 0 {
            return value.characters.count >= self.minLength
        }
        return value.characters.count <= self.maxLength
    }
    
    func getErrorMessage(field: ViewWrapper) -> String {
        return NSLocalizedString("invalid.error.field", comment: "")
    }
}





