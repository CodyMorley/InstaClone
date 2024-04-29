//
//  CircularProfileImageView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/28/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall: 40
        case .small: 48
        case .medium: 64
        case .large: 80
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageURL = user.profileImageURL {
            KFImage(URL(string: imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray))
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.mockUsers[0], size: .large)
}
