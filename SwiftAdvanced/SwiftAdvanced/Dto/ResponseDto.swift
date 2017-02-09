//
//  ResponseDto.swift
//  BaseAdapters
//
//  Created by kasturi gopal on 07/02/17.
//  Copyright © 2017 axionet. All rights reserved.
//

import UIKit

class ResponseDto: Mappable {
    
    var valid = Bool()
    var message = String()
    
    init() {
        
    }

    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        valid    <- map["valid"]
        message  <- map["message"]
    }
    
}
