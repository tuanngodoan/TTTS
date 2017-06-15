//
//  HomeViewController.swift
//  TTTS
//
//  Created by Doan Tuan on 5/17/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var menuSideBarButton: UIBarButtonItem!
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    var postsInfo:PostInfo!
    let service = ServiceManager.sharedInstant
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPost()
        addTargetMenuside()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
//        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
    }

    func addTargetMenuside(){
        if self.revealViewController() != nil {
            self.revealViewController().rearViewRevealWidth = 228

            menuSideBarButton.target = self.revealViewController()
            menuSideBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func getPost(){
        
            self.service.getPosts { (dictPost, error) in
                
                if error == nil {
            
                    self.postsInfo = PostInfo(itemsDict: dictPost!)
                    self.reloadTableView()
            }
            
        }
    }
    
    func reloadTableView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postsInfo.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeInfoCollectionViewCell
        cell.backgroundColor = UIColor.white
        
        cell.titleLabel.text = postsInfo.items[indexPath.row].title
        cell.descLabel.text = postsInfo.items[indexPath.row].descriptionPost
        DispatchQueue.global().async {
            
            let url = URL(string: self.postsInfo.items[indexPath.row].urlImage)
            cell.thumbImage.sd_setShowActivityIndicatorView(true)
            cell.thumbImage.sd_setIndicatorStyle(.gray)
            DispatchQueue.main.async {
                
                cell.thumbImage.sd_setImage(with: url, placeholderImage: UIImage(named: "image\(indexPath.row)"), options: .refreshCached)
                cell.thumbImage.layer.cornerRadius = 12
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postVC") as? PostDetailViewController
        {
            
            detailVC.titleString = postsInfo.items[indexPath.row].title
            detailVC.urlString = postsInfo.items[indexPath.row].urlImage
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }

}


















