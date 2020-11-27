//
//  PicklistVC.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit

class PicklistVC: UIViewController {
    
    @IBOutlet var picklistEntireTV: UITableView!
    var picklistArray:[PicklistData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picklistEntireTV.delegate = self
        picklistEntireTV.dataSource = self
        picklistEntireTV.separatorStyle = .none
        
        setPicklistArray()
        
    }
    
    func setPicklistArray(){
        
        picklistArray.append(contentsOf: [
            PicklistData(pickImg: "listImgContents1", pickTitle: "퇴근하고 한강에서 만나요, 한강 취미 5", pickSubtitle: "남는 시간에 뭐하지?", pickBookmark: "247"),
            PicklistData(pickImg: "listImgContents2", pickTitle: "가을향 가득한 전어 요리를 먹으러 가려면", pickSubtitle: "오늘은 뭘 먹지? 전어를 먹을까 맛있겠지 전어", pickBookmark: "123"),
            PicklistData(pickImg: "listImgContents3", pickTitle: "선선해서 딱 좋은 아차산 나홀로 등산", pickSubtitle: "건강한 아웃도어 라이프", pickBookmark: "54"),
            PicklistData(pickImg: "listImgContents4", pickTitle: "따스하고 포근한 내 방 인테리어 TIP", pickSubtitle: "나도 할 수 있다! 내 방 꾸미기!", pickBookmark: "473"),
            PicklistData(pickImg: "listImgContents1", pickTitle: "퇴근하고 한강에서 만나요, 한강 취미 5", pickSubtitle: "남는 시간에 뭐하지?", pickBookmark: "247"),
            PicklistData(pickImg: "listImgContents2", pickTitle: "가을향 가득한 전어 요리를 먹으러 가려면", pickSubtitle: "오늘은 뭘 먹지? 전어를 먹을까 맛있겠지 전어", pickBookmark: "123"),
            PicklistData(pickImg: "listImgContents3", pickTitle: "선선해서 딱 좋은 아차산 나홀로 등산", pickSubtitle: "건강한 아웃도어 라이프", pickBookmark: "54"),
            PicklistData(pickImg: "listImgContents4", pickTitle: "따스하고 포근한 내 방 인테리어 TIP", pickSubtitle: "나도 할 수 있다! 내 방 꾸미기!", pickBookmark: "473")
        ])
    }
    
    
    
}

extension PicklistVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //섹션을 3개로 나눔
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //섹션2일때만 picklistarray만큼 return
        if section == 2 {
            return picklistArray.count
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        //첫번째 둘러보기 셀 정의
        let touringCell = tableView.dequeueReusableCell(withIdentifier: "TouringTVCell") as! TouringTVCell
        
        //두번째 태그 셀 정의
        let tagCell = tableView.dequeueReusableCell(withIdentifier: "PickTagTVCell") as! PickTagTVCell
        
        //세번째 픽리스트 셀 정의
        let picklistCell = tableView.dequeueReusableCell(withIdentifier: "PicklistTVCell") as! PicklistTVCell
        
        picklistCell.picklistImgView.image = UIImage(named: picklistArray[indexPath.row].pickImg)
        picklistCell.picklistTitleLabel.text = picklistArray[indexPath.row].pickTitle
        picklistCell.picklistSubtitleLabel.text = picklistArray[indexPath.row].pickSubtitle
        picklistCell.picklistBookmarkCntLabel.text = picklistArray[indexPath.row].pickBookmark
        
        
        // 각 섹션에 해당하는 셀 넣어주기
        if indexPath.section == 0 {
            return touringCell
        }
        else if indexPath.section == 1 {
            return tagCell
        }
        else {
            return picklistCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //섹션별 row사이즈 지정해주기
        if indexPath.section == 0 {
            return 207
        }
        else if indexPath.section == 1 {
            return 168
        }
        else {
            return 242
        }
    }
    
}
