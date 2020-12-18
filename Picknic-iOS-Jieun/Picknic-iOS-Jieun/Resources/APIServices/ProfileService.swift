//
//  ProfileService.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/12/18.
//

import Foundation
import Alamofire

struct ProfileService {
    
    static let shared = ProfileService()
    
    func getProfile(completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.profileURL
        let header: HTTPHeaders = [ "Content-Type":"application/json"]
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default, headers: header)
        
        
        dataRequest.responseData {(response) in
            switch response.result { case .success:
                guard let statusCode = response.response?.statusCode else { return
                }
                guard let data = response.value else {
                    return
                }
                completion(judgeProfileData(status: statusCode, data: data))
            case .failure(let err): print(err)
                completion(.networkFail) }
        }
    }
    
    
    
    private func judgeProfileData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<UserData>.self, from: data) else {
            return .pathErr }
        switch status {
        case 200:
            print("나 성공이야")
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail }
    }
    
    
    
    func postProfileImg(image:UIImage,completion: @escaping (NetworkResult<Any>) -> (Void)){
        
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
            .responseJSON(completionHandler: { response in
                        //Do what ever you want to do with response
                            if let error = response.error {
                                print(error)
                            }
                            guard let data = response.value else {
                                return
                            }
                            print(data)
                })
            .response { resp in
                print("안녕",resp)
                
            }
    }
    
    //ImageUploadData
    private func judgeImageUploadData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<ImageUploadData>.self, from: data) else {
            return .pathErr }
        switch status {
        case 200:
            print("나 성공이야???")
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail }
    }
}
