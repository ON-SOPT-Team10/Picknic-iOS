import Foundation
import Alamofire
import SwiftyJSON

struct getMainService {
    static let shared = getMainService()
    
    func getMain(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.mainURL
        
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
        
        case 200...299: return getMain(by: json)
        case 400...499: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    
    
    private func getMain(by json: JSON) -> NetworkResult<Any> {
        let data = json["data"] as JSON
        
        let mainData = mainDataModel(
            
            stories: data["stories"].map({story in
                let story = JSON(story.1)
                return storyDataModel(
                    id: story["id"].int ?? 0,
                    storyImage: story["storyImage"].string ?? "",
                    storyTitle: story["storyTitle"].string ?? ""
                )
            }),
            feeds: data["feeds"].map({feed in
                let feed = JSON(feed.1)
                return feedDataModel(
                    id: feed["id"].int ?? 0,
                    feedImage: feed["feedImage"].string ?? "",
                    feedTitle: feed["feedTitle"].string ?? "",
                    feedContents: feed["feedContents"].string ?? "",
                    bookmarkCount: feed["bookmarkCount"].int ?? 0,
                    isBookmarked: feed["isBookmarked"].bool ?? false,
                    TagId: feed["TagId"].int ?? 0
                )
            })
        )
        return .success(mainData)
    }
}
