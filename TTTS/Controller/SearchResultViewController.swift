//
//  SearchResultViewController.swift
//  TTTS
//
//  Created by Doan Tuan on 5/24/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var menuSideButton: UIBarButtonItem!
    
    
    var leaderBoard:LeaderBoard!
    let service = ServiceManager.sharedInstant
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetMenuside()
        getLeaderBoard()
    }

    
    
    func addTargetMenuside(){
        if self.revealViewController() != nil {
            self.revealViewController().rearViewRevealWidth = self.view.frame.width * 2 / 3
            menuSideButton.target = self.revealViewController()
            menuSideButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func reloadTableView(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func getLeaderBoard(){
        
        service.getLeaderBoard { (dict, error) in
            if error == nil {
                
                self.leaderBoard = LeaderBoard(boardDict: dict!)
                self.reloadTableView()
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leaderBoard.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! ResultCollectionViewCell
        
        cell.numDreamLabel.text = leaderBoard.items[indexPath.row].numberOfDream!
        cell.studyNameLabel.text = leaderBoard.items[indexPath.row].nameStudy!
        cell.baseMarkLabel.text = leaderBoard.items[indexPath.row].markBase!
        cell.rankLabel.text = leaderBoard.items[indexPath.row].rankOfUser! + "/" + leaderBoard.items[indexPath.row].numberOfStudy!
        cell.viewDream.layer.cornerRadius = 12
        cell.layer.cornerRadius  = 12
        if Double(leaderBoard.items[indexPath.row].rankOfUser!)! > Double(leaderBoard.items[indexPath.row].numberOfStudy!)! {
            
            cell.warningImageView.image = UIImage(named: "red.png")
        }else{
            if Double(leaderBoard.items[indexPath.row].rankOfUser!)! > (Double(leaderBoard.items[indexPath.row].numberOfStudy!)! * 0.8) {
                
                 cell.warningImageView.image = UIImage(named: "yellow.png")
            }else{
                if Double(leaderBoard.items[indexPath.row].rankOfUser!)! <  (Double(leaderBoard.items[indexPath.row].numberOfStudy!)! * 0.5) {
                    cell.warningImageView.image = UIImage(named: "green.png")
                }
            }
        }

    return cell
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
