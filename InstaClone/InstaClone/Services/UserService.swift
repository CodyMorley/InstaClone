//
//  UserService.swift
//  InstaClone
//
//  Created by Cody Morley on 4/27/24.
//

import Firebase
import Foundation

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap { try? $0.data(as: User.self) }
    }
    
    static func fetchUser(uuid: String) async throws -> User {
        let userData = try await Firestore.firestore().collection("users").document(uuid).getDocument()
        return try userData.data(as: User.self)
    }
    
}
