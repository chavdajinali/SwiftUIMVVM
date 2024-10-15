//
//  UserViewModel.swift
//  MVVMDemoSwiftUI
//
//  Created by chavda jinali on 15/10/24.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    // Published properties to update the View
    @Published var userName: String = "Loading..."
    @Published var userEmail: String = ""

    private var userService: UserService
    private var cancellables = Set<AnyCancellable>()

    init(userService: UserService = UserService()) {
        self.userService = userService
        fetchUser()
    }

    func fetchUser() {
        userService.getUser()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("User fetched successfully.")
                case .failure(let error):
                    self.userName = "Error"
                    self.userEmail = error.localizedDescription
                }
            }, receiveValue: { [weak self] user in
                self?.userName = user.name
                self?.userEmail = user.email
            })
            .store(in: &cancellables)
    }
}
