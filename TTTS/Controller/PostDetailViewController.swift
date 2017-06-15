//
//  postDetailViewController.swift
//  TTTS
//
//  Created by Doan Tuan on 5/30/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit
import SDWebImage
class PostDetailViewController: UIViewController {

    
    @IBOutlet weak var titlePostLabel: UILabel!
    
    @IBOutlet weak var contentDetailTextView: UITextView!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    var titleString = ""
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlePostLabel.text = titleString
        
        
        
        DispatchQueue.global().async {
            let url = URL(string: self.urlString)
            self.thumbImageView.sd_setShowActivityIndicatorView(true)
            self.thumbImageView.sd_showActivityIndicatorView()
            
            DispatchQueue.main.async {
                
                self.thumbImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "image"), options: .refreshCached)
                self.thumbImageView.layer.cornerRadius = 12
                self.thumbImageView.layer.borderColor = UIColor.orange.cgColor
                self.thumbImageView.layer.borderWidth = 2.0
            }
        }

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
