//
//  ViewController.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 09/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import UIKit


class ViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var emailErrorIcon: UIButton!
    @IBOutlet weak var passErrorIcon: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passErrorLabel: UILabel!
    
    var activeField: UITextField?
    
    var form = Form()
    var loginDto = LoginDto()
 
    public func moveToNext(loginResponseDto:ResponseDto) {
 
        let alertview = UIAlertView.init(title: "welcome", message: "You are now logged in", delegate: self, cancelButtonTitle: "OK");
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
        
        self.userNameText.delegate = self;
        self.passwordText.delegate = self;
        self.registerForKeyboardNotifications()
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated);
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#Pragma mark - Text field delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return true;
    }
    
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification){
        //Once keyboard disappears, restore original positions
        
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        activeField = nil
    }
}

