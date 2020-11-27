//
//  CustomButton.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/11/25.
//

import UIKit

class CustomButton: UIButton {

    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.tintColor = UIColor(displayP3Red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        self.layer.borderColor = CGColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 20
        self.titleEdgeInsets  = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)


    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
