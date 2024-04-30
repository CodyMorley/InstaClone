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
        posts = try await PostService.fetchFeedPosts()
    }
}
