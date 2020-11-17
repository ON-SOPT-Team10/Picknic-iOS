//
//  PickListVC.swift
//  Picknic-iOS
//
//  Created by 황지은 on 2020/11/14.
//

import UIKit

class PickListVC: UIViewController {

    @IBOutlet var pickListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickListTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}
extension PickListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PickListTableCell0.identifier) as? PickListTableCell0 else {
            return UITableViewCell()
        }
        cell.setCell()
        return cell
        
//        switch indexPath.row {
//        case 0:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickListTableCell0.identifier) as? PickListTableCell0 else {
//                return UITableViewCell()
//            }
//            cell.setCell()
//            return cell
//
//
//        default:
//            break
//        }
        
//        return UITableViewCell()
    }
    
    
}
