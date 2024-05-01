//
//  PostGridViewModel.swift
//  InstaClone
//
//  Created by Cody Morley on 4/30/24.
//

import Foundation

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        posts = try await PostService.fetchUserPosts(uuid: user.id)
        
        for i in 0..<posts.count {
            posts[i].user = user
        }
    }
}
