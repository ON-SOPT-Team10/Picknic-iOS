//
//  ProfileVC.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit

class ProfileVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var profileImgView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userEmailLabel: UILabel!
    var profileImg:UIImage?
    var profileImgName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()
        profileImgView.clipsToBounds = true
        //이미지뷰 라운드로 변경하기
        profileImgView.layer.cornerRadius = profileImgView.frame.height / 2
        
    }
    
    func getDataFromServer(){
        ProfileService.shared.getProfile { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let userData = data as? UserData {
                    
                    self.userNameLabel.text = userData.userName
                    self.userEmailLabel.text = userData.userEmail
                    let url = URL(string: userData.profileImage)
                    let imageData = try? Data(contentsOf: url!)
                    self.profileImgView.image = UIImage(data: imageData!)
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
        }
    }
    
    @IBAction func touchUpPhotoBtn(_ sender: Any) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.sourceType = .photoLibrary
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    
    // MARK: - 이미지 피커 사라지고 이미지 변경됨 => 이때 post로 서버통신 해주어야함!
    
    func imagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
           let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            profileImgName = url.lastPathComponent
            profileImg = image
            self.profileImgView.image = profileImg
        }
        ProfileService.shared.postProfileImg(image: profileImg!) { (networkResult) -> (Void) in
            switch networkResult {
            case .success:
               print("upload success")
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
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel (_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
  
}
