//
//  ViewController.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 09/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var emailErrorIcon: UIButton!
    @IBOutlet weak var passErrorIcon: UIButton!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passErrorLabel: UILabel!
    
    var form = Form()
    var loginDto = LoginDto()
    
    @IBAction func signInAction(_ sender: Any) {
        if self.form.isFormValid() {
            
            self.view.updateDataObjectFromView() //Sync dto from newly entered values.
            let a = SABaseAdapter()
            a.LoginDetails(loginDto:loginDto);
            
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
            $0.errorMessageLabel = nil
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

