//
//  PostService.swift
//  InstaClone
//
//  Created by Cody Morley on 4/30/24.
//

import Firebase
import Foundation

struct PostService {
    private static let postsCollection = Firebase.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let data = try await postsCollection.getDocuments()
        var posts = try data.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0..<posts.count {
            var post = posts[i]
            let ownerID = post.ownerUUID
            let owner = try await UserService.fetchUser(uuid: ownerID)
            posts[i].user = owner
        }
        
        return posts
    }
    
    static func fetchUserPosts(uuid: String) async throws -> [Post] {
        let dataQuery = try await postsCollection.whereField("ownerUUID", isEqualTo: uuid).getDocuments()
        return try dataQuery.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
