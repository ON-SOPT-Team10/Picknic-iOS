import Foundation

struct mainDataModel: Codable {
    let stories: [storyDataModel]
    let feeds: [feedDataModel]
}

struct storyDataModel: Codable {
    let id: Int
    let storyImage: String
    let storyTitle: String
}

struct feedDataModel: Codable {
    let id: Int
    let feedImage: String
    let feedTitle: String
    let feedContents: String
    let bookmarkCount: Int
    let isBookmarked: Bool
    let TagId: Int
}
