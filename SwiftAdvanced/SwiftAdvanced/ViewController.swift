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
        
        let fieldEmail = Field.init(view: emailField, errorMessageView: emailErrorLabel, errorHintView: emailErrorIcon, validationsArray:NSArray.init(array: [IsEmpty(), IsValidEmail()]) as! [NSArray])
        
        self.form.addNewField(fieldEmail);
        
        let fieldPassword = Field.init(view: passField, errorMessageView: passErrorLabel, errorHintView: passErrorIcon, validationsArray:NSArray.init(array: [IsEmpty()]) as! [NSArray])
        
        self.form.addNewField(fieldPassword);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

