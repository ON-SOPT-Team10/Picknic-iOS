//
//  PickTagTVCell.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit

class PickTagTVCell: UITableViewCell {
    
    @IBOutlet var tagCV: UICollectionView!
    var taglistArray:[TagData] = [] {
        
        //시작하자마자 '전체' 태그 눌려있게 하기
        didSet {
            tagCV.delegate = self
            tagCV.dataSource = self
            tagCV.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .top)
            collectionView(self.tagCV, didSelectItemAt: IndexPath(item: 0, section: 0))
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        tagCV.delegate = self
        tagCV.dataSource = self
        
        setTaglistArray()
    }
    
    
    func setTaglistArray(){
        taglistArray.append(contentsOf: [
            TagData(tagName: "전체"),
            TagData(tagName: "내추천추천"),
            TagData(tagName: "맛집추천"),
            TagData(tagName: "아웃도어"),
            TagData(tagName: "반려동물"),
            TagData(tagName: "가족"),
            TagData(tagName: "나혼자산다"),
            TagData(tagName: "YOLO")
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension PickTagTVCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taglistArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PicklistTagCVCell", for: indexPath) as! PicklistTagCVCell
        
        tagCell.pickTagLabel.text = taglistArray[indexPath.row].tagName
        
        let label = UILabel(frame: CGRect.zero)
        label.text = taglistArray[indexPath.row].tagName
        label.sizeToFit()
        
        tagCell.layer.cornerRadius = 18
        tagCell.layer.borderColor = CGColor(srgbRed: 146/255, green: 146/255, blue: 146/255, alpha: 1.0)
        tagCell.layer.borderWidth = 1
        
        
        
        return tagCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label = UILabel(frame: CGRect.zero)
        label.text = taglistArray[indexPath.row].tagName
        label.sizeToFit()
        return CGSize(width: label.frame.width + 20, height: 38
        )
    }
    
    //서버 연결 이후 재정비할 부분
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == tagCV {
            print(taglistArray[indexPath.row])
            // 카테고리 필터링 코드
            
            var allCategoryCheck: Bool = false
            
            if taglistArray[indexPath.row].tagName  == "전체" {
                allCategoryCheck = true
               // itemFilteredArray = itemList
                
                //노티 써서 reload시켜야함
                //ivDataTableView.reloadData()
            }
            
            
            if !allCategoryCheck {
                
               // itemFilteredArray = []
               // let filtered = itemList.filter { (inventory) -> Bool in
                //    return inventory.categoryIdx == tagArray[indexPath.row].categoryIdx
                }
                
             //   for data in filtered {
               //     itemFilteredArray.append(data)
         //       }
         
             //   ivDataTableView.reloadData()
            }
        }
    
}
