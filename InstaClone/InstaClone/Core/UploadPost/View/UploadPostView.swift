//
//  UploadPostView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import PhotosUI
import SwiftUI

struct UploadPostView: View {
    @Binding var tabIndex: Int
    @State private var caption = ""
    @State private var pickerPresented = false
    @StateObject private var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            // Header action toolbar
            HStack {
                Button {
                    clearPostDataAndDismiss()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task { try await viewModel.uploadPost(caption: caption) }
                    clearPostDataAndDismiss()
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // Image + caption
            HStack(spacing: 6) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            pickerPresented.toggle()
        }
        .photosPicker(isPresented: $pickerPresented,
                      selection: $viewModel.selectedImage)
    }
    
    func clearPostDataAndDismiss() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
