//
//  getProfileService.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/12/16.
//

import Foundation
import Alamofire
import SwiftyJSON

struct getProfileService {
    static let shared = getProfileService()
    
    func getProfile(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.profileURL //+ "/\(foodType)"
     
        let dataRequest = AF.request(url,
                                     method : .get,
                                     encoding: JSONEncoding.default)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                
                let json = JSON(value)
                
                let networkResult = self.judge(by: statusCode, json)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
        
        
        private func judge(by statusCode: Int, _ json: JSON) -> NetworkResult<Any>  {
            switch statusCode {
                
            case 200...299: return getProfile(by: json)
            case 400...499: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
            }
        }
    
    
    
    private func getProfile(by json: JSON) -> NetworkResult<Any> {
        let data = json["data"] as JSON
        var profileData = profileDataModel(id: data[0]["id"].intValue,
                                           profileImage: data[0]["profileImage"].stringValue, userName: data[0]["userName"].stringValue, userEmail: data[0]["userEmail"].stringValue)
        return .success(profileData)
    }
}
