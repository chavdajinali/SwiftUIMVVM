//
//  ContentView.swift
//  MVVMDemoSwiftUI
//
//  Created by chavda jinali on 15/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        UserView(viewModel: UserViewModel())
        UsersListView(viewModel: UsersViewModel())
    }
}

#Preview {
    ContentView()
}
