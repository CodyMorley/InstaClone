//
//  ProfileView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/20/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    private let postFrameDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var posts: [Post] {
        Post.mockPosts.filter { $0.user?.username == user.username}
    }
    
    
    var body: some View {
        ScrollView {
            // header
            VStack(spacing: 10) {
                HStack {
                    // User Profile Pic + Stats
                    Image(user.profileImageURL ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        UserStatView(value: 3,
                                     title: "Posts")
                        
                        UserStatView(value: 556,
                                     title: "Followers")
                        
                        UserStatView(value: 12,
                                     title: "Following")
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 4) {
                    // name
                    if let full = user.fullName {
                        Text(full)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    // bio
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                
                Button {
                    // edit profile button action
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                
                Divider()
            }
            
            // post grid view
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
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.mockUsers[0])
}
