//
//  IsInRange.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation

class IsInRange:Validator {
    
    var minValue:Int = -1
    var maxValue:Int = -1
    
    convenience init(min: Int, andMax max: Int) {
        self.init()
        self.minValue = min
        self.maxValue = max
    }
    
    func isValidField(field: ViewWrapper) -> Bool {
        if Int(field.getText())! >= self.minValue && Int(field.getText())! <= self.maxValue {
            return true
        }
        return false
    }
    
    func getErrorMessage(field: ViewWrapper) -> String {
        return NSLocalizedString("invalid.error.range", comment: "")
    }
}

