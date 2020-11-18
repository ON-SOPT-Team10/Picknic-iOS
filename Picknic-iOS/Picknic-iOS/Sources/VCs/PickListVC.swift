//
//  PickListVC.swift
//  Picknic-iOS
//
//  Created by 황지은 on 2020/11/14.
//

import UIKit

class PickListVC: UIViewController {

    @IBOutlet var pickListTableView: UITableView!
    
    var items: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemData()
        pickListTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func setItemData(){
        items.append(contentsOf: [
        Item(title: "퇴근하고 한강에서 만나요, 한강 취미 5", subtitle: "남는 시간에 뭐하지?", imageName: "listImgContents1", bookmark: "247"),
        Item(title: "가을향 가득한 전어 요리를 먹으러 가려면...", subtitle: "오늘은 뭘 먹지? 전어를 먹을까 맛있겠지 전어", imageName: "listImgContents2", bookmark: "123"),
        Item(title: "선선해서 딱 좋은 아차산 나홀로 등산", subtitle: "건강한 아웃도어 라이프", imageName: "listImgContents3", bookmark: "54"),
        Item(title: "따스하고 포근한 내 방 인테리어 TIP", subtitle: "나도 할 수 있다! 내 방 꾸미기!", imageName: "listImgContents2", bookmark: "472")])
    }
}
extension PickListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickListTableCell0.identifier) as? PickListTableCell0 else {
                return UITableViewCell()
            }
            cell.setCell()
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickListTableCell1.identifier) as? PickListTableCell1 else {
                return UITableViewCell()
            }
        
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickListTableCell2.identifier) as? PickListTableCell2 else { return UITableViewCell() }
            cell.setCell(item: items[indexPath.row - 2]) //rank: indexPath.row,
            return cell
//            break
        }
        
//        return UITableViewCell()
    }
}
