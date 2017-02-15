//
//  ViewController.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 09/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import UIKit


class ViewController: BaseViewController {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var emailErrorIcon: UIButton!
    @IBOutlet weak var passErrorIcon: UIButton!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passErrorLabel: UILabel!
    
    var form = Form()
    var loginDto = LoginDto()
 
    public func moveToNext(loginResponseDto:ResponseDto) {
 
        let alertview = UIAlertView.init(title: "Success !", message: "You are now logged in", delegate: self, cancelButtonTitle: "OK");
        alertview .show()
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        if self.form.isFormValid() {
            
            self.view.updateDataObjectFromView() //Sync dto from newly entered values.
        
            let loginViewModel = LoginViewModel.init(withController:self);
            loginViewModel.callLogin(loginDto: self.loginDto)
        }
        else{
            print("Form is not valid ");
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creating Email Field.
        let emailField = Field(build: {
            $0.fieldView = self.userNameText
            $0.errorHintView = self.emailErrorIcon
            $0.errorMessageLabel = self.emailErrorLabel
            $0.validationItemsArray = NSArray.init(array: [IsEmpty(), IsValidEmail()])
        });
        self.form.addNewField(emailField);
        
        //Creating Password Field.
        let passField = Field(build: {
            $0.fieldView = self.passwordText
            $0.errorHintView = self.passErrorIcon
            $0.errorMessageLabel = self.passErrorLabel
            $0.validationItemsArray = NSArray.init(array: [IsEmpty()])
        });
        self.form.addNewField(passField);
 
        self.view.dataObject = loginDto
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

