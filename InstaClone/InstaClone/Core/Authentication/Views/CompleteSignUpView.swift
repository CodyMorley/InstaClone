//
//  CompleteSignUpView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/21/24.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registrationViewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Text("Welcome to Instagram, \(registrationViewModel.username) ")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            Text("Click below to complete your registration and start using Instagram.")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button {
                Task { try await registrationViewModel.createUser() }
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    CompleteSignUpView()
}
