//
//  addProfileImageService.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/12/16.
//

import Foundation
import Alamofire

struct addProfileImageService {
    static let shared = addProfileImageService()
    
    func addProfileImage(data: String,
                completion: @escaping (NetworkResult<Any>) -> ()) {
        
        let url = APIConstants.profileURL
        let header: HTTPHeaders = [
            "Content-Type": "multipart/form-data"
        ]
        let body: Parameters = [
            "data" : data
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        dataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                
                guard let data = response.value else {
                    return
                }
//                completion(judegeSignInData(status: statusCode, data: data))
                
            case.failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
//    private func judegeSignInData(status: Int, data: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//        guard let decodedData = try?decoder.decode(GenericResponse<SignInData>.self, from: data) else {
//            return .pathErr
//        }
//        switch status {
//        case 200:
//            return .success(decodedData.data)
//        case 400:
//            return .requestErr(decodedData.message)
//        case 500:
//            return .serverErr
//        default:
//            return .pathErr
//        }
//    }
}
