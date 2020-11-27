//
//  PickListTableCell2.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/11/18.
//

import UIKit

class PickListTableCell2: UITableViewCell {

    static let identifier = "PickListTableCell2"
    
    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var bookmarkCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setCell(item: Item) {
        itemImageView.image = item.makeImage()
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        subtitleLabel.textColor = UIColor(displayP3Red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
        bookmarkCount.text = item.bookmark
        bookmarkCount.textColor = UIColor(displayP3Red: 176/255, green: 176/255, blue: 176/255, alpha: 1)
    }
}
