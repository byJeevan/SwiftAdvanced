//
//  LoginDto.swift
//  BaseAdapters
//
//  Created by kasturi gopal on 08/02/17.
//  Copyright © 2017 axionet. All rights reserved.
//

import UIKit

class LoginDto: Mappable {
    
    var userNameText = String()
    var passwordText = String()
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        userNameText    <- map["userNameText"]
        passwordText         <- map["passwordText"]
    }


//    init(userText:String, passText:String) {
//        self.userNameText = userText
//        self.passwordText = passText
//    }

}