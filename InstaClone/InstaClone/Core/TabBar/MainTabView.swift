//
//  MainTabView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/20/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            
            Text("Notifications")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }
                .tag(3)
            
            ProfileView(user: User.mockUsers[0])
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
