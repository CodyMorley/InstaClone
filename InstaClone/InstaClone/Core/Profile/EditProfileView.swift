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
    @State private var bio = ""
    @State private var fullName = ""
    @State private var selectedImage: PhotosPickerItem?
    
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
                        NSLog("update profile info")
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            PhotosPicker(selection: $selectedImage) {
                VStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            VStack {
                EditProfileRowView(text: $fullName,
                                   title: "Name",
                                   placeholderText: "Enter your name...")
                
                EditProfileRowView(text: $bio,
                                   title: "Bio",
                                   placeholderText: "Enter a short bio...")
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView()
}