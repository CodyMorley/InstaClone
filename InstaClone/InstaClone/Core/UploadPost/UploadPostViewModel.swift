//
//  UploadPostViewModel.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

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
    
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
    }
}
