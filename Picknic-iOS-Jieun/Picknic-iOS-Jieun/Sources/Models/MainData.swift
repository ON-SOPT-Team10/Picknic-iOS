//
//  MainData.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/12/17.
//

import Foundation

struct MainData: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let data: EntireData?
}

// MARK: - DataClass
struct EntireData: Codable {
    let stories: [Story]?
    let feeds: [Feed]?
}

// MARK: - Feed
struct Feed: Codable {
    let id: Int
    let feedImage: String
    let feedTitle, feedContents: String
    let bookmarkCount: Int
    let isBookmarked: Bool
    let tagID: Int

    enum CodingKeys: String, CodingKey {
        case id, feedImage, feedTitle, feedContents, bookmarkCount, isBookmarked
        case tagID = "TagId"
    }
}

// MARK: - Story
struct Story: Codable {
    let id: Int
    let storyImage: String
    let storyTitle: String
}
