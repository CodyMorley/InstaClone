//
//  EditProfileView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/27/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            // toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        NSLog("update profile info")
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                Divider()
            }
            
            // edit profile pic
            
            // name
            
            // bio
        }
    }
}

#Preview {
    EditProfileView()
}
