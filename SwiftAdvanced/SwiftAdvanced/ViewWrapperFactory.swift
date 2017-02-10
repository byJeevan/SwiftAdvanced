//
//  ViewWrapperFactory.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation
import UIKit

class ViewWrapperFactory : NSObject {
    
    func getViewWrapper(_ view: UIView) -> ViewWrapper {
        if (view is UITextField) {
            return UITextFieldViewWrapper.init(view:view)
        }
        else if (view is UITextView) {
            //        return  [[UISpinnerViewWrapper alloc] initWithView:view];
        }
 
        return ViewWrapper()
    }
    
}

