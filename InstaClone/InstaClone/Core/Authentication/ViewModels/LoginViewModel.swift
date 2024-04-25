//
//  LoginViewModel.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(for: email, password: password)
    }
}
