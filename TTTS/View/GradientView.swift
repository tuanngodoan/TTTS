//
//  GradientView.swift
//  TTTS
//
//  Created by Doan Tuan on 5/28/17.
//  Copyright © 2017 Doan Tuan. All rights reserved.
//

import UIKit

class DreamView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable
    public var cornerRadius: CGFloat = 12.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }

}
