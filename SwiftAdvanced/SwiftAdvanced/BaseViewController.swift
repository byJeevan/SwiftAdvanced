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
        let alertview = UIAlertView.init(title: "Opps!", message: self.getMessageFromError(error:error), delegate: self, cancelButtonTitle: "OK");
        alertview .show()
    }
    
    func getMessageFromError(error:Error) -> String {
        //Reference : http://nshipster.com/nserror/
        switch (error as NSError).code  {
            
        case -1001:
            return "Connection timed out"
            
        case -1005:
            return "The connection failed because the network connection was lost"
            
        case -1009:
            return "Device not connected to internet"
            
        default:
            return "Unknown error occured"
        }
        
        
    }
    
}
