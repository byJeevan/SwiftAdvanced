//
//  ViewController.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 09/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBAction func signInAction(_ sender: Any) {
        
         let a = SABaseAdapter()
        
        a.LoginDetails(loginDto: LoginDto());
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

