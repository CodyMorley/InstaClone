//
//  PostGridView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import SwiftUI

struct PostGridView: View {
    var posts: [Post]
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    private let postFrameDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2) {
            ForEach(posts) { post in
                Image(post.imageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: postFrameDimension, height: postFrameDimension)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.mockPosts)
}
