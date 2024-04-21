//
//  ProfileView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/20/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // header
            VStack {
                HStack {
                    // User Profile Pic + Stats
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    // name
                    Text("Silvio Dante")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    // bio
                    Text("Proprietor of The Bada Bing off Route 17")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                
                Button {
                    // edit profile button action
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                
                Divider()
            }
            
            // post grid view
        }
    }
}

#Preview {
    ProfileView()
}
