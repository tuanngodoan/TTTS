//
//  AboutViewController.swift
//  TTTS
//
//  Created by Doan Tuan on 5/26/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit
import SDWebImage

class AboutViewController: UIViewController {

    @IBOutlet weak var designerImageView: UIImageView!
    
    @IBOutlet weak var devImageView: UIImageView!
    
    @IBOutlet weak var menuSide:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addTargetMenuside()
        designerImageView.image = UIImage(named: "Thanh.jpg")
        designerImageView.layer.cornerRadius = 10
        designerImageView.layer.borderWidth = 3
        designerImageView.layer.borderColor = UIColor.orange.cgColor
        
        devImageView.image = UIImage(named: "Tuan.jpg")
        devImageView.layer.cornerRadius = 10
        devImageView.layer.borderWidth = 3
        devImageView.layer.borderColor = UIColor.orange.cgColor
        
        
        // Do any additional setup after loading the view.
    }


    
    func addTargetMenuside(){
        if self.revealViewController() != nil {
            self.revealViewController().rearViewRevealWidth = self.view.frame.width * 2 / 3
            menuSide.target = self.revealViewController()
            menuSide.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
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
