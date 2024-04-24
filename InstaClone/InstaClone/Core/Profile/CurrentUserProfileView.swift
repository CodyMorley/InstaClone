//
//  CurrentUserProfileView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/23/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    var posts: [Post] {
        Post.mockPosts.filter { $0.user?.username == user.username}
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.mockUsers[0])
}
