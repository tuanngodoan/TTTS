//
//  QuestionAnswer.swift
//  TTTS
//
//  Created by Doan Tuan on 5/25/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

class ItemQA: NSObject {
    
    var question:String!
    var userName:String!
    var answer:String!
    
    init(qaDict: NSDictionary){
        
        guard let question = qaDict[ConstAPI.question] as? String else{return}
        self.question = question
        
        guard let userName = qaDict[ConstAPI.userName] as? String else{return}
        self.userName = userName
        
        guard let answer   = qaDict[ConstAPI.answer] as? String else{return}
        self.answer = answer
        
    }
}

class QuestionAnswer: NSObject {

    var itemsQA = [ItemQA]()
    
    init(itemsArrDict: NSDictionary){
        
        guard let items  = itemsArrDict[ConstAPI.items] as? [NSDictionary] else {return}
        
        for item in items{
            
            let itemObj = ItemQA(qaDict: item)
            itemsQA.append(itemObj)
        }
    }
    
}
