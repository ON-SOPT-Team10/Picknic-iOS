//
//  ProfileCollectionCell.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/11/17.
//

import UIKit

class ProfileCollectionCell: UICollectionViewCell {
    
   
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    
    static let identifier = "ProfileCollectionCell"
    
    func setItemCell() {
        profileImage.image = UIImage(named: "curator1")
        nicknameLabel.text = "할리스커피"
    }
    
}
