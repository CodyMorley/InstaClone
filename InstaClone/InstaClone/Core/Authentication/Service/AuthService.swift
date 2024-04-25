//
//  AuthService.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import FirebaseAuth
import SwiftUI


class AuthService {
    @Published var session: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.session = Auth.auth().currentUser
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
        } catch {
            NSLog("Error authenticating session to create \(username) for \(email): \(error.localizedDescription).\nMore info: \(error)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch {
            NSLog("Error logging out: \(error.localizedDescription) \nMore Info: \(error)")
        }
    }
}
