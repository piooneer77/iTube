//
//  GenericService.swift
//  FreeHands
//
//  Created by Apple on 7/1/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import Alamofire

class GenericService<Generic> where Generic : Codable {
    
    func List(baseURL: String, methodName: String, parameters: [String: Any]?, completionHandler: @escaping ((Generic?) -> Void), errorHandler: @escaping ((String?) -> Void)){
        
        let url = baseURL + methodName
        
        if Method.isConnectedToInternet() {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            Alamofire.request(url, method: .get, parameters: parameters).validate().responseString { (response) in
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                switch response.result {
                    
                case .success:
                    completionHandler(self.buildArrayFromResponse(response: response.data))
                    
                case .failure(let error):
                    print(error)
                    errorHandler(response.result.value)
                }
            }
        }
    }
    
    func Create(baseURL: String, methodName: String, parameters: Any?, completionHandler: @escaping ((Generic?) -> Void), errorHandler: @escaping ((String) -> Void)){
        
        let url = baseURL + methodName
        
        if Method.isConnectedToInternet() {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            Alamofire.request(url, method: .post, encoding: URLEncoding.default).validate().response(completionHandler: { (response) in
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                if response.response?.statusCode == 201 {
                    completionHandler(self.buildObjectFromResponse(response: response.data))
                } else {
                    errorHandler((response.error?.localizedDescription)!)
                }
            })
        }
    }
    
    func Update(baseURL: String, methodName: String, parameters: [String: Any]?, completionHandler: @escaping ((Generic?) -> Void), errorHandler: @escaping ((String) -> Void)){
        
        
        
    }
    
    func Delete(baseURL: String, methodName: String, parameters: Any?, completionHandler: @escaping (([Generic]?) -> Void), errorHandler: @escaping ((String) -> Void)){
        
        
        
    }
    
    private func buildObjectFromResponse(response: Data?) -> Generic? {
        
        var object : Generic?
        do {
            object = try JSONDecoder().decode(Generic.self , from: response!)
        } catch (let error){
            print(error)
        }
        return object
    }
    
    private func buildArrayFromResponse(response: Data?) -> Generic? {
        
        var object : Generic?
        do {
            object = try JSONDecoder().decode(Generic.self , from: response!)
        } catch (let error){
            print(error)
        }
        return object
    }
    
}

