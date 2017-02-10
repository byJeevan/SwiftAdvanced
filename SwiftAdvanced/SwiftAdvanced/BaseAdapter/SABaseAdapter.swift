//
//  SABaseAdapter.swift
//  SwiftAdvanced
//
//  Created by kasturi gopal on 09/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import UIKit

class SABaseAdapter: BaseAdapter {
    
    func LoginDetails(loginDto:LoginDto) {
        
        let urlString = "http://192.168.3.197:8080/v1/login"
        
        self.performHttpPostRequest(urlString: urlString, dto:loginDto);
    }

}
