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
    
    
    @IBAction func touchUpChangeImage(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func getData() {
        getProfileService.shared.getProfile() { (result) in
            switch(result) {
            case .success(let data):
                if let profileDataModel = data as? profileDataModel {
                    let url = URL(string: profileDataModel.profileImage)
                    let data = try? Data(contentsOf: url!)
                    self.profileImageView.image = UIImage(data: data!)
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
extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            guard let selectedImage = info[.originalImage] as? UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            }

        profileImageView.image = selectedImage
        

            dismiss(animated: true, completion: nil)
        }

}
