//
//  PostInfo.swift
//  TTTS
//
//  Created by Doan Tuan on 5/19/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

class info: NSObject {

    var title:String!
    var descriptionPost:String!
    var urlImage:String!
    
    init(dictPost: NSDictionary) {
        
        guard let title = dictPost[ConstAPI.title] as? String else {return}
        self.title = title
        
        guard let descriptionPost = dictPost[ConstAPI.descriptionPost] as? String else {return}
        self.descriptionPost = descriptionPost
        
        guard let thumbDict = dictPost[ConstAPI.thumbnails] as? NSDictionary else {return}
        guard let defaultImage = thumbDict[ConstAPI.defaultImage] as? NSDictionary else {return}
        guard let url = defaultImage[ConstAPI.url] as? String else {return}

        self.urlImage = url
    }
}

class PostInfo: NSObject {
 
    var items:[info]!
    
   init(itemsDict: NSDictionary) {
        
        guard let itemsPost = itemsDict["items"] as? [NSDictionary] else {return}
        items = [info]()
    
        for item in itemsPost{
            let post = info(dictPost: item)
            // print(post.urlImage)
            self.items.append(post)
        }
    }
}


