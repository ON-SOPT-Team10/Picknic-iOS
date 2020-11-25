//
//  HashTagCollectionCell.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/11/25.
//

import UIKit

class HashTagCollectionCell: UICollectionViewCell {
    static let identifier = "HashTagCollectionCell"
    
    @IBOutlet var hashTagBtn: UIButton!
    
    func setCell(hashTag: String) {
        hashTagBtn.setTitle(hashTag, for: .normal)
    }
    

}
