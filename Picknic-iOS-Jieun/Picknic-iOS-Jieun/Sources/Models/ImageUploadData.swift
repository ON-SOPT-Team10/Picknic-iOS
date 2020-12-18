//
//  ImageUploadData.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/12/18.
//

import Foundation
// MARK: - ImageUploadData
struct ImageUploadData: Codable {
    let status: Int
    let success: Bool
    let data: String
}
