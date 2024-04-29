//
//  EditProfileView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/27/24.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: viewModel.user,
                                                 size: .large)
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            VStack {
                EditProfileRowView(text: $viewModel.fullName,
                                   title: "Name",
                                   placeholderText: "Enter your name...")
                
                EditProfileRowView(text: $viewModel.bio,
                                   title: "Bio",
                                   placeholderText: "Enter a short bio...")
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.mockUsers[0])
}
