//
//  PickListTableCell0.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/11/17.
//

import UIKit

class PickListTableCell0: UITableViewCell {

    static let identifier = "PickListTableCell0"
    @IBOutlet var cellTitleLabel: UILabel!
    
    @IBOutlet var cell0CollectionView: UICollectionView!
    
    var listProfiles: [ListProfile] = []
    
    let topInset: CGFloat = 23
    let bottomInset: CGFloat = 21
    let itemSpacing: CGFloat = 8
    let horizonInset: CGFloat = 20
    let rightSpacing: CGFloat = 20
    let lineSpacing: CGFloat = 30
    
    func setCell() {
        setProfileData()
        cell0CollectionView.dataSource = self
        cell0CollectionView.delegate = self
    }
    func setProfileData(){
        listProfiles.append(contentsOf: [
        ListProfile(imageName: "curator1", nickName: "할리스커피"),
        ListProfile(imageName: "curator2", nickName: "동역사거주자"),
        ListProfile(imageName: "curator3", nickName: "뮤지컬볼래"),
        ListProfile(imageName: "curator3", nickName: "퇴근하고싶다")
        ])
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension PickListTableCell0: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionCell.identifier, for: indexPath) as? ProfileCollectionCell else {
            return UICollectionViewCell()
        }
        cell.setItemCell(profile: listProfiles[indexPath.row])
        return cell
    }
}

extension PickListTableCell0: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = (collectionView.frame.height - topInset - bottomInset)
        let cellWidth = (collectionView.frame.width - lineSpacing - rightSpacing) / 4.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topInset, left: horizonInset, bottom: bottomInset, right: horizonInset) }
}
