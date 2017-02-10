//  The converted code is limited by 1 KB.
//  Please Sign Up (Free!) to remove this limitation.

//  Converted with Swiftify v1.0.6242 - https://objectivec2swift.com/
//
//  Form.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.

import Foundation
import UIKit

class Form: NSObject {
    
    var fieldsArray = NSMutableArray()
    var errorMessageDefaultHidden = false
    
    func addNewField(_ field: Field) {
        self.fieldsArray.add(Fields.init(field: field, andDependenctyField: nil))
    }
    
    func addNewField(_ field: Field, withDependencyField dependencyField: Field) {
        self.fieldsArray.add(Fields.init(field: field, andDependenctyField: nil))
    }
    
    func isFormValid() -> Bool {
        
        var isAllFieldsValid: Bool = false
        var isErrorFieldFound: Bool = false
        
        //Loop via every Fields object array
        
            for  item in self.fieldsArray {
              
                let fieldsObject = item as! Fields
                
                let wrapperFirstField: ViewWrapper = fieldsObject.firstField.viewWrapperField!
                
                //Reset fields error views
                fieldsObject.firstField.hideErrorField(fieldsObject.firstField)
                
                let wrapperDependencyField: ViewWrapper? = fieldsObject.dependencyField?.viewWrapperField
                
                fieldsObject.dependencyField?.hideErrorField( fieldsObject.dependencyField)
                
                //Case 1 - If No dependency field, then validate first field
                if (wrapperDependencyField == nil) {
                    isAllFieldsValid = self.isValidField(fieldsObject.firstField)
                }
                
                //Case 2 - If dependency field, validate it followed by first field only if valid.
                if wrapperDependencyField?.getText().isEmpty == false {
                    isAllFieldsValid = self.isValidField(fieldsObject.dependencyField!)
                    if isAllFieldsValid {
                        //if df valid then, only validate first field.
                        isAllFieldsValid = self.isValidField(fieldsObject.firstField)
                    }
                }
                
                //To focus on first error field order.
                if !isAllFieldsValid && !isErrorFieldFound {
                    isErrorFieldFound = true
                    wrapperFirstField.focusToView()
                    if  wrapperDependencyField?.getText().isEmpty == false {
                        wrapperDependencyField?.focusToView()
                    }
                }
         
        } //for loop - Fields array
        
        return !isErrorFieldFound
    }
    
    
    func isValidField(_ field: Field) -> Bool {
        let wrapper: ViewWrapper? = field.viewWrapperField
        if (wrapper?.isHidden)! {
            return true
        }
        //loop for IsEmpty  / IsValidEmail class  objects in the array.
        for item in field.validationItemsArray! {
            let fieldValidationItem = item as! Validator
            if !fieldValidationItem.isValidField(field: wrapper!) {
                field.showErrorField(field, withMessage: fieldValidationItem.getErrorMessage(field: wrapper!), makeMessageVisible: self.errorMessageDefaultHidden)
                return false;
            }
        }
        
        return true;
    }
    
    
}
