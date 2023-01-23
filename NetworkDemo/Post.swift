//
//  Post.swift
//  NetworkDemo
//
//  Created by Jiaming Guo on 2023-01-22.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String // name of profile photo
    let vip: Bool // whether user is vip
    let name: String
    let date: String
    var isFollowed: Bool // whether user is followed
    let text: String
    let images: [String]
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

extension Post {
    // Display comment count or "Comment" on comment button
    var commentCountText: String {
        if commentCount == 0 { return "评论" }
        if commentCount < 1000 { return "\(commentCount)"}
        return String(format: "%.1fk", Double(commentCount)/1000)
    }
    
    // Display like count or "Like" on like button
    var likeCountText: String {
        if likeCount == 0 { return "赞" }
        if likeCount < 1000 { return "\(likeCount)" }
        return String(format: "%.1fk", Double(likeCount)/1000)
    }
}

struct PostList: Codable {
    var list: [Post]
}

func loadPostListData(_ fileName: String) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Cannot find file \"\(fileName)\" in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Cannot load data")
    }
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Cannot parse post list data")
    }
    return list
}
