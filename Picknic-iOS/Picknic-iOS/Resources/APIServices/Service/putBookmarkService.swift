import Foundation
import Alamofire
import SwiftyJSON

struct putBookmarkService {
    static let shared = putBookmarkService()
    
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
                print("성공〰️❗️",resp)
                
            }
    }
    
    
    func putBookmark(_ feedId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.bookmarkURL + "/\(feedId)"
        
        let dataRequest = AF.request(url, method: .put, encoding: JSONEncoding.default)

        dataRequest.responseData { (dataResponse) in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let json = JSON(value)
                
                let networkResult = self.judge(by: statusCode, json)
                DispatchQueue.main.async {
                    completion(networkResult)
                }
            case .failure:
                DispatchQueue.main.async {
                    completion(.networkFail)
                }
            }
        }
    }
    
    
    private func judge(by statusCode: Int, _ json: JSON) -> NetworkResult<Any>  {
        switch statusCode {
        
        case 200...299: return .success("success")
        case 400...499: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
}
