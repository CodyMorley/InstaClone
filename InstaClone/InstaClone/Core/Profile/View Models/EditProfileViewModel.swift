//
//  EditProfileViewModel.swift
//  InstaClone
//
//  Created by Cody Morley on 4/27/24.
//

import Firebase
import PhotosUI
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var bio = ""
    @Published var fullName = ""
    @Published var profileImage: Image?
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(from: selectedImage) }
        }
    }
    @Published var user: User
    private(set) var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
    }
    
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String : Any]()
        
        if let newImage = self.uiImage {
            let imageUrl = try await ImageUploader.uploadImage(image: newImage)
            data["profileImageURL"] = imageUrl
        }
        
        if !fullName.isEmpty && user.fullName != fullName {
            data["fullName"] = fullName
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
