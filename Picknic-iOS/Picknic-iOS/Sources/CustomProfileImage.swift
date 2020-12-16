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
        self.layer.cornerRadius = 50
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
