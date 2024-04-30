//
//  PostGridView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/24/24.
//

import Kingfisher
import SwiftUI

struct PostGridView: View {
    @StateObject var viewModel: PostGridViewModel
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    private let postFrameDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: postFrameDimension, height: postFrameDimension)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(user: User.mockUsers[0])
}
