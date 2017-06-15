//
//  LeaderBoard.swift
//  TTTS
//
//  Created by Doan Tuan on 5/24/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

class Item: NSObject {

    var numberOfDream:String!
    var nameStudy:String!
    var rankOfUser:String!
    var numberOfStudy:String!
    var markBase:String!
    
    init(itemDict: NSDictionary) {
        
        guard let numberOfDream = itemDict[ConstAPI.numberOfDream] as? String else {return}
        self.numberOfDream = numberOfDream
        
        guard let nameStudy = itemDict[ConstAPI.nameStudy] as? String else {return}
        self.nameStudy = nameStudy
        
        guard let rankOfUser = itemDict[ConstAPI.rankOfUser] as? String else {return}
        self.rankOfUser = rankOfUser
        
        guard let numberOfStudy = itemDict[ConstAPI.numberOfStudy] as? String else {return}
        self.numberOfStudy = numberOfStudy
        
        guard let markBase = itemDict[ConstAPI.markBase] as? String else {return}
        self.markBase = markBase
    }
    
}

class LeaderBoard:NSObject {
    
    var items:[Item]!
    
   init(boardDict: NSDictionary) {
        
        guard  let itemArrDict = boardDict[ConstAPI.items] as? [NSDictionary] else {return}
        items = [Item]()
        for itemDict in itemArrDict {
           
            let item = Item(itemDict: itemDict)
            items.append(item)
        }
    }
    
}
