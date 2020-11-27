//
//  PicklistTagCVCell.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit

class PicklistTagCVCell: UICollectionViewCell {
    
    @IBOutlet var pickTagLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                print("select")
                backgroundColor = .black
                pickTagLabel.textColor = .white
            } else {
                print("unselect")
                backgroundColor = .white
                pickTagLabel.textColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1.0) 
            }
        }
    }
}
