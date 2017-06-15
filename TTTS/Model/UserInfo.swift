//
//  UserInfo.swift
//  TTTS
//
//  Created by Doan Tuan on 5/18/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    
    var sbd:String!
    var cmnd:String!
    var name:String!
    var urlImage:String!
    
    init(userDict: NSDictionary) {
        
        guard let sbd = userDict[ConstAPI.sbd] as? String else {return}
        self.sbd = sbd
        guard let cmnd = userDict[ConstAPI.cmnd] as? String else {return}
        self.cmnd = cmnd
        
        guard let name = userDict[ConstAPI.name] as? String else {return}
        self.name = name
        
        guard let avatar = userDict[ConstAPI.avatar] as? NSDictionary else {return}
        guard let url = avatar[ConstAPI.url] as? String else {return}
        
        self.urlImage = url
    }
}
