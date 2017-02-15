//
//  BaseAdapter.swift
//  BaseAdapters
//
//  Created by kasturi gopal on 06/02/17.
//  Copyright © 2017 axionet. All rights reserved.
//

import UIKit

class BaseAdapter: NSObject {
    
    //To Perform GET Request
    func performHttpGetRequest(loginDto:NSDictionary, urlString:String) {
        
        let internetURL = NSURL(string:urlString)
        let manager = AFHTTPSessionManager()
        manager.get((internetURL?.absoluteString)!, parameters: nil, progress: nil, success: {(_ task: URLSessionDataTask, _ responseObject: Any) -> Void in
            
            //         self.jsonLoaded(json: responseObject)
            
        }, failure: {(task: URLSessionDataTask?, error:Error) -> Void in
            //         self.jsonFailed(error: errno as! Error)
        })
    }
    
    // ToPerform POST Request
    func performHttpPostRequest<T: Mappable>(urlString:String, requestDto:T, responseListner:ResponseListner, errorListner:ErrorListner)  {
        
        let internetURL = NSURL(string:urlString)
        
        let jsonString = requestDto.toJSONString()
        let parameters = ["data" :  jsonString!]
        
        let config = URLSessionConfiguration.default
        let manager = AFHTTPSessionManager(sessionConfiguration: config)
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        manager.post((internetURL?.absoluteString)!, parameters: parameters, progress: nil,
                     success: {(_ task: URLSessionDataTask, _ responseObject: Any) -> Void in
                        
                        if let jsonData = try? JSONSerialization.data(withJSONObject: responseObject, options: []) {
                            
                            if let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) {
                                
                                responseListner.responseListerCallback(result: jsonString)
                                
                            }
                        }
                        
        },
                     failure: {(task: URLSessionDataTask?, error:Error) -> Void in
                        
                        errorListner.errorListnerCallback(error: error)
                        
        })
        
        
    }
    
    
    
    // Convert from NSData to json object
    func nsdataToJSON(data: NSData) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
    // Convert from JSON to nsdata
    func jsonToNSData(json: AnyObject) -> NSData?{
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData?
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }
    
    
    func convertStringToDictionary(data: Any) -> [String:AnyObject]? {
        
        do {
            return try JSONSerialization.jsonObject(with: data as! Data , options: .allowFragments) as? [String:AnyObject]
        } catch _ as NSError {
            
            return nil;
        }
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}
