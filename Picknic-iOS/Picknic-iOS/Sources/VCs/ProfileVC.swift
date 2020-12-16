//
//  ProfileVC.swift
//  Picknic-iOS
//
//  Created by 황지은 on 2020/11/14.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        getProfileService.shared.getProfile() { (result) in
            switch(result) {
            case .success(let data):
                if let profileDataModel = data as? profileDataModel {
//                    self.profileImageView.image = UIImage(named: )
                    self.nameLabel.text = profileDataModel.userName
                    self.emailLabel.text = profileDataModel.userEmail
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

}
