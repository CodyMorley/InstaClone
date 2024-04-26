//
//  ContentViewModel.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import Combine
import Firebase
import FirebaseAuth
import SwiftUI


class ContentViewModel: ObservableObject {
    @Published var session: FirebaseAuth.User?
    private let service = AuthService.shared
    private var cancelBag = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$session.sink { [weak self] userSession in
            self?.session = userSession
        }
        .store(in: &cancelBag)
    }
}
