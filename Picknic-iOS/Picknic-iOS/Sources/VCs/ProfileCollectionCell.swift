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
    
    func setItemCell(profile: ListProfile) {
        DispatchQueue.global().async {
            let url =  URL(string: profile.imageName)
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.profileImage.image = UIImage(data: data!)
            }
        }
        nicknameLabel.text = profile.nickName
    }
    
}
