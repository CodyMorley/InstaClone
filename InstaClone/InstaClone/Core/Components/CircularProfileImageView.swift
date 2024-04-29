//
//  CircularProfileImageView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/28/24.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    let user: User
    
    var body: some View {
        if let imageURL = user.profileImageURL {
            KFImage(URL(string: imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(Color(.systemGray))
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.mockUsers[0])
}
