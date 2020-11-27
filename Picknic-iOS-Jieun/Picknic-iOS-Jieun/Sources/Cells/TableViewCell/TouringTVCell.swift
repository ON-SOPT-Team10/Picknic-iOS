//
//  TouringTVCell.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit

class TouringTVCell: UITableViewCell {

    @IBOutlet var touringCV: UICollectionView!
    var touringlistArray:[TouringlistData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        touringCV.delegate = self
        touringCV.dataSource = self
        setTouringlistArray()
    }
    
    func setTouringlistArray(){
        touringlistArray.append(contentsOf: [
            TouringlistData(touringImg: "curator1", touringTitle: "할리스커피"),
            TouringlistData(touringImg: "curator2", touringTitle: "동역사거주"),
            TouringlistData(touringImg: "curator3", touringTitle: "뮤지컬볼래"),
            TouringlistData(touringImg: "curator1", touringTitle: "안녕안녕"),
            TouringlistData(touringImg: "curator2", touringTitle: "큐레이션"),
            TouringlistData(touringImg: "curator3", touringTitle: "picknic~")
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension TouringTVCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return touringlistArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let touringCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TouringCVCell", for: indexPath) as! TouringCVCell
        
        touringCell.touringImgView.image = UIImage(named: touringlistArray[indexPath.row].touringImg)
        touringCell.touringNameLabel.text = touringlistArray[indexPath.row].touringTitle
        
        return touringCell
    }
    
   
}
