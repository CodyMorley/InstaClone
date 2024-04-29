//
//  ProfileHeaderView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfileView: Bool = false
    let user: User
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                // User Profile Pic + Stats
                CircularProfileImageView(user: user)
                
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
                if user.isCurrentUser {
                    showEditProfileView.toggle()
                    NSLog("Show edit profile")
                } else {
                    NSLog("Follow")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
            }
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfileView) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.mockUsers[2])
}
