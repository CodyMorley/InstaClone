//
//  ContentView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/20/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if contentViewModel.session == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let currentUser = contentViewModel.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
