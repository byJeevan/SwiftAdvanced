//
//  BaseViewController.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 15/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation
import UIKit


class BaseViewController : UIViewController {
  
    func showErrorResponse(error:Error) {
      
        let alertview = UIAlertView.init(title: "Error Occured", message: error.localizedDescription, delegate: self, cancelButtonTitle: "OK");
        alertview .show()
        
    }
    
}
