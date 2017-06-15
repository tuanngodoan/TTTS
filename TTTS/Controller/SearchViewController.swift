//
//  ViewController.swift
//  TTTS
//
//  Created by Doan Tuan on 5/17/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

import AFNetworking

class SearchViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    static var userInfo:UserInfo!
    let service = ServiceManager.sharedInstant
    
    var width:CGFloat!
    var height:CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        AFNetworkReachabilityManager.shared().startMonitoring()
        self.inputTextField.delegate = self
        self.inputTextField.layer.borderColor = UIColor(red: 249/255, green: 136/255, blue: 0/255, alpha: 0.4).cgColor
        self.inputTextField.layer.borderWidth  = 1.0
        self.inputTextField.layer.cornerRadius = 12
        width = self.view.frame.width
        height = self.view.frame.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func keyBoardWillShow(notification: Notification){
        print("Show")
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            let keyboardHeight = keyboardSize.height
            print(keyboardHeight)
           
            UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut, animations: {
               
                self.view.frame = CGRect(x: 0, y: -keyboardHeight/3, width: self.width, height: self.height)
                
            },completion: { (finished) in
               // do something
            })
        }
    }
    
    func keyBoardWillHide(notification: Notification){
        self.view.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
    }
    
    
    func isConnectNetWorking() -> Bool{
    
        if  AFNetworkReachabilityManager.shared().isReachable {
            return true
        }else {
            return false
        }
    }
    
    
    func showArlet(title:String, mess: String){
        
        let alert = UIAlertController(title: title, message: mess, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Oke", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if isConnectNetWorking() {
            
            
            // Thiếu api nên xử lý tù vật thế này =.=
            var idString = ""
            if inputTextField.text! == "THPT_Thanh" {
                
                idString = inputTextField.text!
            }else{
                if inputTextField.text! == "123456789123"{
                    
                    idString = inputTextField.text!
                }else{
                        idString = ""
                }
            }
            if idString == "" {
                
                showArlet(title: "SDB/CMND không chính xác", mess: "Vui lòng thử lại")
            }else {
                service.getUser(sbd: idString, cmnd: "") { (dataDict, error) in
                    if error == nil {
                        
                        SearchViewController.userInfo = UserInfo(userDict: dataDict!)
                        self.pushRevealVC()
                    }
                }
            }

        }else{
            
            showArlet(title: "Không thể kết nối mạng", mess: "Vui lòng kiểm tra lại")
        }
        
        return true
    }
    

    
    
    func getUserInfo(){
        
    }

    func pushRevealVC(){
        
        
        if let vcReveal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "revealVC") as? SWRevealViewController{
            //vcReveal.idSV = "THPT"
            //self.navigationController?.pushViewController(vcReveal, animated: true)
            self.present(vcReveal, animated: true, completion: { 
                //
            })
        }
    }
}

