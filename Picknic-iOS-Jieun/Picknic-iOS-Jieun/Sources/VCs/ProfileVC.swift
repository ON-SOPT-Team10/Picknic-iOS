//
//  ProfileVC.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit

class ProfileVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var profileImgView: UIImageView!
    var profileImg:UIImage?
    var profileImgName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImgView.clipsToBounds = true
        //이미지뷰 라운드로 변경하기
        profileImgView.layer.cornerRadius = profileImgView.frame.height / 2
        
    }
    
    @IBAction func touchUpPhotoBtn(_ sender: Any) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.sourceType = .photoLibrary
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
           let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            profileImgName = url.lastPathComponent
            profileImg = image
            self.profileImgView.image = profileImg
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel (_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
  
}
