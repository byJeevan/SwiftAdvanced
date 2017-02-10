//
//  UITextFieldViewWrapper.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation
import UIKit

//  Converted with Swiftify v1.0.6242 - https://objectivec2swift.com/
class UITextFieldViewWrapper: ViewWrapper, ViewWrapperProtocol {
    
    var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       // fatalError("init(coder:) has not been implemented")
           super.init(coder:aDecoder)
    }
    
    convenience init(view: UIView) {

        self.init(frame:view.frame);
        
        self.textField = (view as? UITextField)

    }
    
    func getText(_ :Void) -> String {
        return self.textField.text!
    }
    
    func getView(_ :Void) -> UIView {
        return self.textField!
    }
    
    func focusToView(_ :Void) {
        self.textField.becomeFirstResponder()
    }
}
