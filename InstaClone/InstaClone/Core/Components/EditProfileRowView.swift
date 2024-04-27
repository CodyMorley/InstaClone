//
//  EditProfileRowView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/27/24.
//

import SwiftUI

struct EditProfileRowView: View {
    @Binding var text: String
    let title: String
    let placeholderText: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholderText, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileRowView(text: .constant(""), title: "Name", placeholderText: "Enter your name")
}
