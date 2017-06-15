//
//  ServiceManager.swift
//  TTTS
//
//  Created by Doan Tuan on 5/18/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

import AFNetworking

class ServiceManager: NSObject {

    
    static let sharedInstant = ServiceManager()
    let manager:AFHTTPSessionManager!
    
    override init() {
        manager = AFHTTPSessionManager() 
    }
    
    func getUser(sbd: String, cmnd: String, completion: @escaping (_ data: NSDictionary?,_ error:Error?)->()){
        
        var path = ""
        if sbd == "THPT_Thanh" {
            
            path = ConstAPI.PATH.users
        }else{
            if sbd == "123456789123" {
                
                path = ConstAPI.PATH.user1
            }
        }
        
        let urlString = ConstAPI.url_Base.appending(path)
    
        manager.get(urlString, parameters: nil, progress: nil, success: { (urlDataTask, dataRespone) in
            ///
            let dataUser = dataRespone as? NSDictionary
           print(dataUser as Any)
           completion(dataUser, nil)
        }) { (urlDataTask, error) in
            print(error.localizedDescription)
            //
        }
    }
    
    func getPosts(completion: @escaping (_ dataDict: NSDictionary?, _ error: Error?)->()){
        let path = ConstAPI.PATH.posts
        let urlString = ConstAPI.url_Base.appending(path)
        
        manager.get(urlString, parameters: nil, progress: nil, success: { (urlDataTask, dict) in
            
            let dictPost = dict as? NSDictionary
            //print(dictPost as Any)
            completion(dictPost, nil)
        }) { (urlTask, error) in
            print(error.localizedDescription)
        }
    }
    
    
    func getLeaderBoard(completion: @escaping (_ dataDict: NSDictionary?, _ error: Error?)->()){
        
        let path = ConstAPI.PATH.leaderBoard
        let urlString = ConstAPI.url_Base.appending(path)
        
        manager.get(urlString, parameters: nil, progress: nil, success: { (urlDataTask, dataRespon) in
            
            let dict = dataRespon as? NSDictionary
            completion(dict, nil)
        
        }) { (urlDataTask, error) in
            
            completion(nil, error)
        }
    }
    
    func getQA(completion: @escaping (_ dataDict: NSDictionary?, _ error: Error?)->()){
        
        let path = ConstAPI.PATH.QA
        
        let urlString = ConstAPI.url_Base.appending(path)
        
        
        manager.get(urlString, parameters: nil, progress: nil, success: { (urlTask, dataRespone) in
            
            let dict = dataRespone as! NSDictionary
            //print(dict)
            completion(dict, nil)
            
        }) { (urlTask, error) in
            print(error.localizedDescription)
            completion(nil, error)
        }

    }
}
