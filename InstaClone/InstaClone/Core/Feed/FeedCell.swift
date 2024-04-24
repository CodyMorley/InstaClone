//
//  FeedCell.swift
//  InstaClone
//
//  Created by Cody Morley on 4/21/24.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            HStack {
                if let user = post.user {
                    //user image and username
                    Image(user.profileImageURL ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.leading, 8)
            
            // post image
            Image(post.imageURL)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            HStack(spacing: 16) {
                // interactive elements like-comment-share
                Button {
                    NSLog("Like Post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    NSLog("Comment Post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    NSLog("Share Post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            // likes counter
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // caption
            HStack {
                Text("\(post.user?.username ?? "") ")
                    .fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            // time stamp
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.mockPosts[0])
}
