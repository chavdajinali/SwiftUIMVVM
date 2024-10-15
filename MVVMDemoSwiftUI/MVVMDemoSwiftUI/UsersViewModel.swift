//
//  UsersViewModel.swift
//  MVVMDemoSwiftUI
//
//  Created by chavda jinali on 15/10/24.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private var userService: UserService
    private var cancellables = Set<AnyCancellable>()

    init(userService: UserService = UserService()) {
        self.userService = userService
        fetchUsers()
    }

    func fetchUsers() {
        isLoading = true
        errorMessage = nil

        userService.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] users in
                self?.users = users
            })
            .store(in: &cancellables)
    }
}
