//
//  addProfileImageService.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/12/16.
//

import Foundation
import Alamofire
import SwiftyJSON

struct addProfileImageService {
    static let shared = addProfileImageService()
    
    func addProfileImage(image:UIImage, completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.profileURL
        let header: HTTPHeaders = [ "Content-Type":"multipart/form-data"]
        
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(image.jpegData(compressionQuality: 0.5)!, withName: "image" , fileName: "\(Date.init().timeIntervalSince1970).jpg", mimeType: "image/jpeg")
            },
            to: url, method: .post , headers: header)
            
            .uploadProgress(queue: .main, closure: { progress in
                //Current upload progress of file
                print("Upload Progress: \(progress.fractionCompleted)")
            })
            .response { resp in
                print("되나,,?",resp)
                
            }
    }
}
