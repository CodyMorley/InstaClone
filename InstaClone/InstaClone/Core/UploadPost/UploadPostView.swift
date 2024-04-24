//
//  UploadPostView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import PhotosUI
import SwiftUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var pickerPresented = false
    @StateObject private var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            // Header action toolbar
            HStack {
                Button {
                    NSLog("Cancel upload")
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    NSLog("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // Image + caption
            HStack(spacing: 6) {
                if let image = viewModel.profileImage {
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
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
}

#Preview {
    UploadPostView()
}
