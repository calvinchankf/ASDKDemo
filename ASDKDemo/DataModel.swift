//
//  DataModel.swift
//  ASDKDemo
//
//  Created by calvin on 2/2/2017.
//  Copyright © 2017年 me.calvinchankf. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataModel {
    
    func fetch(complete: @escaping ([[Item]]) -> ()) {
        var items = [[Item]]()
        Alamofire.request("https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty").responseJSON { response in
            //            print(response.request)  // original URL request
            //            print(response.response) // HTTP URL response
            //            print(response.data)     // server data
            //            print(response.result)   // result of response serialization
            
            guard let res = response.result.value else {
                return
            }
            
            let json = JSON(res)
            print(json["search_results"].arrayValue.count)
            for (_, subJson): (String, JSON) in json["search_results"] {
                let imgs = subJson["listing"]["picture_urls"]
                var temp = [Item]()
                for (_, subsubJson) in imgs {
                    if let url = URL(string: subsubJson.stringValue) {
                        let someTitle = String(arc4random_uniform(10000))
                        let newItem = Item(imgURL: url, title: someTitle)
                        temp.append(newItem)
                    }
                }
                items.append(temp)
            }
            DispatchQueue.main.async {
                complete(items)
            }
        }
    }
}
