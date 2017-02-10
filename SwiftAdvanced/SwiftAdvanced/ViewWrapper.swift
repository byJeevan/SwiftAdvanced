//
//  ViewWrapperInterface.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation
import UIKit

//protocol ViewWrapperProtocol {
//    
//    func getView(_ :Void) -> UIView
//    
//    func getText(_ :Void) -> String
//    
//    func focusToView(_ :Void)
//    
//}


class ViewWrapper: UIView {
   
    internal func focusToView(_: Void) {
        
    }

   
    internal func getText(_: Void) -> String {
        return ""
    }

    
    internal func getView(_: Void) -> UIView {
        
        return self
    }

}
