//
//  AuthService.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth
import SwiftUI


class AuthService {
    @Published var currentUser: User?
    @Published var session: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login(for email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.session = result.user
        } catch {
            NSLog("Error authenticating session for \(email): \(error.localizedDescription).\nMore info: \(error)")
        }
    }
    
    @MainActor
    func createUser(for email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.session = result.user
            await self.uploadUserData(id: result.user.uid, username: username, email: email)
        } catch {
            NSLog("Error authenticating session to create \(username) for \(email): \(error.localizedDescription).\nMore info: \(error)")
        }
    }
    
    func loadUserData() async throws {
        session = Auth.auth().currentUser
        
        guard let currentUserId = session?.uid else { return }
        let userData = try await Firestore.firestore().collection("users").document(currentUserId).getDocument()
        currentUser = try userData.data(as: User.self)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch {
            NSLog("Error logging out: \(error.localizedDescription) \nMore Info: \(error)")
        }
    }
    
    private func uploadUserData(id: String, username: String, email: String) async {
        let user = User(email: email, id: id, username: username)
        guard let encoded = try? Firestore.Encoder().encode(user) else { return }
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encoded)
    }
}
