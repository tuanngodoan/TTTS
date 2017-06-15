//
//  MenuViewController.swift
//  TTTS
//
//  Created by Doan Tuan on 5/18/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit
import SDWebImage

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var iDLabel: UILabel!
    
    @IBOutlet weak var idCMTLabel: UILabel!

    @IBOutlet weak var viewInfo: UIView!
    
    @IBOutlet weak var colllectionView: UICollectionView!
    
    var userObj:UserInfo!
    var menuItmes:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewInfo.addDropShadowToView(targetView: self.viewInfo)
        
        menuItmes = ["homeCell","resultCell","searchCell","messCell","infoCell","logoutCell"]
        userObj = SearchViewController.userInfo
        loadCollectionView()
        self.userNameLabel.text = userObj.name
        self.iDLabel.text = userObj.sbd
        self.idCMTLabel.text = userObj.cmnd
        
        DispatchQueue.global().async {
            
            let url = URL(string: self.userObj.urlImage)
            self.userAvatarImageView.layer.cornerRadius = self.userAvatarImageView.frame.width/2
            self.userAvatarImageView.layer.borderColor = UIColor.orange.cgColor
            self.userAvatarImageView.layer.borderWidth = 4.0
            
            self.userAvatarImageView.sd_setShowActivityIndicatorView(true)
            self.userAvatarImageView.sd_setIndicatorStyle(.gray)
        
            DispatchQueue.main.async {

                self.userAvatarImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "imageAvata"), options: .refreshCached)
                self.userAvatarImageView.backgroundColor = UIColor.orange
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    
       // hide status bar
//    override var prefersStatusBarHidden : Bool {
//        return true
//    }
    
    func loadCollectionView(){
        colllectionView.delegate  = self
        colllectionView.dataSource = self
        //colllectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = menuItmes[indexPath.row]
        
        let cell = colllectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MenuCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 5 {
            print("TAPPPPPPPP")
            
            if let vcSearch = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as? SearchViewController {
                self.present(vcSearch, animated: true, completion: { 
                    //
                })
            }
            
        }
    
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

