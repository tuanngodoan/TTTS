//
//  StudyViewController.swift
//  TTTS
//
//  Created by Doan Tuan on 5/25/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

class QAViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var nemuSideBar: UIBarButtonItem!
    @IBOutlet weak var collectionView:UICollectionView!
    
    @IBOutlet var answerView: UIView!
    
    let service = ServiceManager.sharedInstant
    var question:QuestionAnswer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuestion()
        addTargetMenuside()
        // Do any additional setup after loading the view.
    }
    
    
    func reloadCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    
    func getQuestion(){
        
        service.getQA {(dictObject, error) in
            
            if error == nil {
                
                self.question = QuestionAnswer(itemsArrDict: dictObject!)
                self.reloadCollectionView()
            }
        }
        
    }
    
    func addTargetMenuside(){
        if self.revealViewController() != nil {
            self.revealViewController().rearViewRevealWidth = self.view.frame.width * 2 / 3
            nemuSideBar.target = self.revealViewController()
            nemuSideBar.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  question.itemsQA.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studyCell", for: indexPath) as! QACollectionViewCell
        
        cell.questionLabel.text = question.itemsQA[indexPath.row].question
        cell.user.text = question.itemsQA[indexPath.row].userName
        cell.layer.cornerRadius = 12
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //showAnswerView(answerString: question.itemsQA[indexPath.row].answer)


        
    }
    
    func showAnswerView(answerString: String){
        print("Show view")
        self.answerView.backgroundColor = UIColor.red
        self.answerView.frame = CGRect(x: 10, y: 200, width: 355, height: 120)
        self.view.addSubview(answerView)
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
