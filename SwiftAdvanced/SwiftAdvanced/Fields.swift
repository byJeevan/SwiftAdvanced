//
//  Fields.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation
import UIKit

class Fields : NSObject {
    
    var firstField: Field!
    var dependencyField: Field?

     convenience init(field firstField: Field, andDependenctyField dependencyField: Field?) {
        
        self.init()
        self.firstField = firstField
        self.dependencyField = dependencyField
        
    }
    
}
