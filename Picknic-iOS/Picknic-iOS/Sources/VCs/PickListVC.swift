//
//  PickListVC.swift
//  Picknic-iOS
//
//  Created by 황지은 on 2020/11/14.
//

import UIKit

class PickListVC: UIViewController {

    @IBOutlet var pickListTableView: UITableView!
    
    private var stories: [ListProfile] = []
    private var items: [Item] = []
    private var selectedCell: IndexPath?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        pickListTableView.dataSource = self
    }
    
    func getData() {
        getMainService.shared.getMain() { (result) in
            switch(result) {
            case .success(let data):
                self.items = []
                self.stories = []
                if let mainDataModel = data as? mainDataModel {
                    for feed in mainDataModel.feeds {
                        let newItem = Item(
                            id: feed.id,
                            title: feed.feedTitle,
                            subtitle: feed.feedContents,
                            imageName: feed.feedImage,
                            bookmark: "\(feed.bookmarkCount)",
                            isBookmarked: feed.isBookmarked
                        )
                        self.items.append(newItem)
                    }
                    
                    for story in mainDataModel.stories {
                        let newStory = ListProfile(imageName: story.storyImage, nickName: story.storyTitle)
                        self.stories.append(newStory)
                    }
                    self.pickListTableView.reloadData()
                }
            case .requestErr(_):
                print("error")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }

    }
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? PickListTableCell2 else {
            return // or fatalError() or whatever
        }
        
        let indexPath = pickListTableView.indexPath(for: cell)
        
        if let row = indexPath?.row {
            print(row - 1)
            putBookmarkService.shared.putBookmark(row - 1) { [weak self] (result) in
                switch(result) {
                case .success(_):
                    if let row = indexPath?.row, let items = self?.items {
                        if (items[row - 1].isBookmarked) {
                            sender.setImage(UIImage(named: "listBtnBookmark1"), for: .normal)
                        }
                        else {
                            sender.setImage(UIImage(named: "selectBookmark"), for: .normal)
                        }
                    }
                    self?.getData()
                    print("success")
                case .requestErr(_):
                    print("error")
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
            }
        }
        
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
            cell.setCell(data: stories)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickListTableCell1.identifier) as? PickListTableCell1 else {
                return UITableViewCell()
            }
            cell.setCell()
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickListTableCell2.identifier) as? PickListTableCell2 else { return UITableViewCell() }
            cell.setCell(item: items[indexPath.row - 2])
            return cell

        }
    }
  
}
