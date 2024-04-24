//
//  ContentView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.session == nil {
                LoginView()
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
