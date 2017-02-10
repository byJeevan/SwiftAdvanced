//
//  Validator.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation

protocol Validator {
    
    func isValidField(field : ViewWrapper) -> Bool
    
    func getErrorMessage(field :ViewWrapper) -> String
}

