//
//  UploadPostViewModel.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import Firebase
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var postImage: Image?
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(from: selectedImage) }
        }
    }
    private var uiImage: UIImage?
    
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageURL = try await ImageUploader.uploadImage(image: uiImage) else { return }
        
        let post = Post(caption: caption,
                        id: postRef.documentID,
                        imageURL: imageURL,
                        likes: 0,
                        ownerUUID: uid,
                        timestamp: Timestamp())
        
        guard let encoded = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encoded)
    }
}
