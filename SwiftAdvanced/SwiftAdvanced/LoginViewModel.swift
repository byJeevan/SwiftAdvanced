//
//  LoginViewModel.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 15/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation

class LoginViewModel : BaseViewModel {
    
    var loginResponseHandler = LoginResponseHandler()
    
    convenience init(withController:ViewController) {
        self.init()
        self.loginResponseHandler =  LoginResponseHandler.init(withController:withController)
        
    }    
    
    class LoginResponseHandler :NSObject, ResponseListner, ErrorListner {
        var viewController = ViewController()
        
        convenience init(withController:ViewController) {
            self.init()
            self.viewController =  withController;
     
        }
        
        func responseListerCallback(result:String) {
        
            let responseDto = ResponseDto(JSONString:result)
            self.viewController.moveToNext(loginResponseDto:responseDto!);
        }
        
        func errorListnerCallback(error: Error) {
            print("ERROR OCUURED");
 
        }
    }
    
    func callLogin(loginDto:LoginDto) {
 
        SABaseAdapter().getLoginDetails(loginDto: loginDto, responseListner:loginResponseHandler, errorListner:loginResponseHandler)
    }
    
}
