//
//  MeetingViewController.swift
//  TTTS
//
//  Created by Doan Tuan on 5/26/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

class MeetingViewController: UIViewController {

    
    @IBOutlet weak var menuSide:UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetMenuside()
        
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
