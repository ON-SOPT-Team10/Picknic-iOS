//
//  CustomProfileImage.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/12/16.
//

import UIKit

class CustomProfileImage: UIImageView {

    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
