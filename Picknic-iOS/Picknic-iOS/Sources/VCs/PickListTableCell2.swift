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
    @IBOutlet weak var bookmarkButton: UIButton!
    
    private var feedId: Int?
    private var isBookmarked: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setCell(item: Item) {
        DispatchQueue.global().async {
            let url =  URL(string: item.imageName)
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.itemImageView.image = UIImage(data: data!)
            }
        }
        feedId = item.id
        isBookmarked = item.isBookmarked
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        subtitleLabel.textColor = UIColor(displayP3Red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
        bookmarkCount.text = item.bookmark
        bookmarkCount.textColor = UIColor(displayP3Red: 176/255, green: 176/255, blue: 176/255, alpha: 1)
        bookmarkButton.setImage(item.isBookmarked ? UIImage(named: "selectBookmark"): UIImage(named: "listBtnBookmark1"), for: .normal)
    }
    
}

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
