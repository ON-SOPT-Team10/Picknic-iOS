//
//  PickListTableCell1.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/11/18.
//

import UIKit

class PickListTableCell1: UITableViewCell {

    static let identifier = "PickListTableCell1"
    
    let topInset: CGFloat = 15
    let bottomInset: CGFloat = 15
    let itemSpacing: CGFloat = 10
    let horizonInset: CGFloat = 20
    let rightSpacing: CGFloat = 20
    let lineSpacing: CGFloat = 7
    
    var hashTagArr: [String] = []
    
    @IBOutlet var cell1CollectionView: UICollectionView!
    
    func setCell() {
        setItemData()
        cell1CollectionView.dataSource = self
        cell1CollectionView.delegate = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setItemData(){
        hashTagArr.append(contentsOf: [
            "전체", "추천", "맛집추천", "아웃도어", "반려동물", "가족", "나혼자산다", "YOLO"])
    }

}
extension PickListTableCell1: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HashTagCollectionCell.identifier, for: indexPath) as? HashTagCollectionCell else {
            return UICollectionViewCell()
        }
        cell.setCell(hashTag: hashTagArr[indexPath.row])
        return cell
    }
}

extension PickListTableCell1: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = (collectionView.frame.height - topInset - bottomInset - itemSpacing) / 2
        let cellWidth = (collectionView.frame.width - lineSpacing - rightSpacing) / 4
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topInset, left: horizonInset, bottom: bottomInset, right: horizonInset) }
}
