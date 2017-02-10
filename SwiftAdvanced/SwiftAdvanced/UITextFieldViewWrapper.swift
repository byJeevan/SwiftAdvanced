//
//  UITextFieldViewWrapper.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation
import UIKit

class UITextFieldViewWrapper: ViewWrapper {
    
    var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder:aDecoder)
    }
    
    convenience init(view: UIView) {
        self.init(frame:view.frame);
        self.textField = (view as? UITextField)
    }
    
    override func getText(_ :Void) -> String {
        return self.textField.text!
    }
    
    override func getView(_ :Void) -> UIView {
        return self.textField!
    }
    
    override func focusToView(_ :Void) {
        self.textField.becomeFirstResponder()
    }
}
