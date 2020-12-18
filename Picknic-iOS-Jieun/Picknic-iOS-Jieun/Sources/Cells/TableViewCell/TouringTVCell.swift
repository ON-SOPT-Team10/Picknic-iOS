//
//  TouringTVCell.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit


class TouringTVCell: UITableViewCell {

    @IBOutlet var touringCV: UICollectionView!
    var storyArray:[Story] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        getDataFromServer()
        touringCV.delegate = self
        touringCV.dataSource = self
    }
    
    func getDataFromServer(){
        MainService.shared.getMain(completion: { networkResult in
                switch networkResult {
                case .success(let data):
                    if let mainData = data as? EntireData {
                        
                        self.storyArray = mainData.stories!
                        self.touringCV.reloadData()

                        print(self.storyArray)
                    }
                    
                case .requestErr(let msg):
                    if let message = msg as? String {
                       print(message)
                    }
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
                
            })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension TouringTVCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let touringCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TouringCVCell", for: indexPath) as! TouringCVCell
        
        let imgUrl = URL(string: storyArray[indexPath.row].storyImage)
        let imgData = try? Data(contentsOf: imgUrl!)
        touringCell.touringImgView.image = UIImage(data: imgData!)
        touringCell.touringImgView.clipsToBounds = true
        touringCell.touringImgView.layer.cornerRadius = touringCell.touringImgView.frame.height / 2
        
        touringCell.touringNameLabel.text = storyArray[indexPath.row].storyTitle
        
        return touringCell
    }
    
   
}
