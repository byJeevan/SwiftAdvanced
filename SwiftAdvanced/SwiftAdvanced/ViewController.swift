//
//  ViewController.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 09/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var emailErrorIcon: UIButton!
    @IBOutlet weak var passErrorIcon: UIButton!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passErrorLabel: UILabel!
    
    var form = Form()
    
    @IBAction func signInAction(_ sender: Any) {
        if self.form.isFormValid() {
            
            let a = SABaseAdapter()
            a.LoginDetails(loginDto: LoginDto());
        }
        else{
            print("Form is not valid ");
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //Creating Email Field.
        let emailField = Field(build: {
            $0.fieldView = self.emailField
            $0.errorHintView = self.emailErrorIcon
            $0.errorMessageLabel = self.emailErrorLabel
            $0.validationItemsArray = NSArray.init(array: [IsEmpty(), IsValidEmail()])
        });
        self.form.addNewField(emailField);
 
        //Creating Password Field.
        let passField = Field(build: {
            $0.fieldView = self.passField
            $0.errorHintView = self.passErrorIcon
            $0.errorMessageLabel = self.passErrorLabel
            $0.validationItemsArray = NSArray.init(array: [IsEmpty()])
        });
        self.form.addNewField(passField);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

