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
    
    func login(for email: String, password: String) async throws {
        
    }
    
    func createUser(for email: String, password: String) async throws {
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        
    }
}
