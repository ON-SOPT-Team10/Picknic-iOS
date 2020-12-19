//
//  APIConstants.swift
//  Picknic-iOS
//
//  Created by 황지은 on 2020/12/05.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.124.67.93:3000"
    
    
    // 리스트 뷰
    static let mainURL = APIConstants.baseURL + "/main"
    
    
    // 프로필 뷰
    static let profileURL = APIConstants.baseURL + "/profile"
    
    
    static let bookmarkURL = APIConstants.baseURL + "/bookmark"
}
