//
//  RestaurantManager.swift
//  Restuarant
//
//  Created by Faran on 3/23/19.
//  Copyright © 2019 Faran. All rights reserved.
//

import UIKit
import Alamofire


class RestaurantManager {
    
    func getRestaurantList(endPoint:String,param:[String:Any],completion: @escaping (RestaurantBase) -> Void){
        
        let headers: [String : String] = [:]
        
        let param = AFParam(endpoint: "", params: param, headers: headers, method: .get, parameterEncoding: URLEncoding.default, images: [])
        
        AFNetwork.shared.apiGeneric(param, modelType:RestaurantBase.self ) { (res) in
            
            if res.status == "OK" {
                completion(res)
            }else{
                Alert.showAlertToast(msg: "Error Occur")
            }
            
        }
    }
    
}
