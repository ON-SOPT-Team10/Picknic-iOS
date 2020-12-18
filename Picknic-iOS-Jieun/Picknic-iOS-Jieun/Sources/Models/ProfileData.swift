//
//  ProfileData.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/12/18.
//

import Foundation
// MARK: - ProfileData
struct ProfileData: Codable {
    let status: Int
    let success: Bool
    let data: UserData
}

// MARK: - UserData
struct UserData: Codable {
    let id: Int
    let profileImage: String
    let userName, userEmail: String
}
