//
//  PicklistVC.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit
import Alamofire
import Kingfisher

class PicklistVC: UIViewController {
    
    @IBOutlet var picklistEntireTV: UITableView!
    var feedArray:[Feed] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()
        picklistEntireTV.delegate = self
        picklistEntireTV.dataSource = self
        picklistEntireTV.separatorStyle = .none
        
    }
    
    func getDataFromServer(){
        MainService.shared.getMain(completion: { networkResult in
            switch networkResult {
            case .success(let data):
                if let mainData = data as? EntireData {
                    
                    self.feedArray = mainData.feeds!
                    self.picklistEntireTV.reloadData()
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
    
    @IBAction func touchUpBookmarkBtn(_ sender: UIButton) {
        let cell = sender.superview?.superview as! PicklistTVCell
        let index = self.picklistEntireTV.indexPath(for: cell)
        var indexPath : IndexPath? = nil
        indexPath = picklistEntireTV.indexPathForRow(at: picklistEntireTV.convert(sender.center, from: sender.superview))
        
        if index!.section == index!.section {
            if index!.section == 2 {
                
                print(feedArray[index!.row].id)
                BookmarkToggleService.shared.toggleUp(feedArray[index!.row].id) { (networkResult) -> (Void) in
                    switch networkResult {
                    case .success:
                        print("success")
                        
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
                    
                }
                getDataFromServer()
            }
            
        }
        
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
            return feedArray.count
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
        
        
        if feedArray.count != 0 {
            let url = URL(string: feedArray[indexPath.row].feedImage)
            let imageData = try? Data(contentsOf: url!)
            picklistCell.picklistImgView.image = UIImage(data: imageData!)
            picklistCell.picklistTitleLabel.text = feedArray[indexPath.row].feedTitle
            picklistCell.picklistSubtitleLabel.text = feedArray[indexPath.row].feedContents
            picklistCell.picklistBookmarkCntLabel.text = "\(feedArray[indexPath.row].bookmarkCount)"
            
            if feedArray[indexPath.row].isBookmarked == true{
                picklistCell.bookmarkSelectBtn.setImage((UIImage(named: "selectBookmark")), for: .normal)
            }
            else {
                picklistCell.bookmarkSelectBtn.setImage((UIImage(named: "listBtnBookmark3")), for: .normal)
            }
            
        }
        
        
        
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
            return 242
        }
        else if indexPath.section == 1 {
            return 168
        }
        else {
            return 242
        }
    }
    
}
