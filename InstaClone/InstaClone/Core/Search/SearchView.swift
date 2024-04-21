//
//  SearchView.swift
//  InstaClone
//
//  Created by Cody Morley on 4/21/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0...15, id: \.self) { user in
                    Text("Silvio")
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
