//
//  PicklistTVCell.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit

class PicklistTVCell: UITableViewCell {

    @IBOutlet var picklistImgView: UIImageView!
    @IBOutlet var picklistTitleLabel: UILabel!
    @IBOutlet var picklistSubtitleLabel: UILabel!
    @IBOutlet var picklistBookmarkCntLabel: UILabel!
    @IBOutlet var isBookmarkSelectedImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
