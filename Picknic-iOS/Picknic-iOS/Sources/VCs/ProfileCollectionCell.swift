//
//  ProfileCollectionCell.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/11/17.
//

import UIKit

class ProfileCollectionCell: UICollectionViewCell {
    
    @IBOutlet var profileBtn: UIButton!
    @IBOutlet var nicknameLabel: UILabel!
    
    static let identifier = "ProfileCollectionCell"
    
    func setCell() {
        profileBtn.setImage(UIImage(named: "curator1"), for: .normal)
        nicknameLabel.text = "할리스커피"
    }
    
}
