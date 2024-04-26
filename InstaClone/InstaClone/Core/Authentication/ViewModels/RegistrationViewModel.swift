//
//  RegistrationViewModel.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(for: email,
                                                password: password,
                                                username: username)
        username = ""
        email = ""
        password = ""
    }
}
