//
//  ImageUploader.swift
//  InstaClone
//
//  Created by Cody Morley on 4/28/24.
//

import Firebase
import FirebaseStorage
import SwiftUI

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        
        let fileName = UUID().uuidString
        let fileRef = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await fileRef.putDataAsync(imageData)
            let url = try await fileRef.downloadURL()
            return url.absoluteString
        } catch {
            NSLog("Error uploading image data to image store service: \(error.localizedDescription) \nMore Info: \(error)")
            return nil
        }
    }
}
