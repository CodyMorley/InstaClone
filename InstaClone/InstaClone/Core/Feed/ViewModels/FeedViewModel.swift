//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Cody Morley on 4/30/24.
//

import Firebase
import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        let data = try await Firestore.firestore().collection("posts").getDocuments()
        posts = try data.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0..<posts.count {
            var post = posts[i]
            let ownerID = post.ownerUUID
            let owner = try await UserService.fetchUser(uuid: ownerID)
            posts[i].user = owner
        }
    }
}
