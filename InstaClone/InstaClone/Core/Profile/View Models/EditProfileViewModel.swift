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
    
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
