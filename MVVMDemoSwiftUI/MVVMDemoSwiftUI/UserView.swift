//
//  UserView.swift
//  MVVMDemoSwiftUI
//
//  Created by chavda jinali on 15/10/24.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel: UserViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.userName)
                .font(.largeTitle)
                .padding()

            Text(viewModel.userEmail)
                .font(.subheadline)
                .foregroundColor(.gray)

            Button(action: {
                viewModel.fetchUser()
            }) {
                Text("Refresh")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
