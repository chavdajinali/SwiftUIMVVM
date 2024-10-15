//
//  UserService.swift
//  MVVMDemoSwiftUI
//
//  Created by chavda jinali on 15/10/24.
//

import Foundation
import Combine

class UserService {
    func getUser() -> AnyPublisher<User, Error> {
        // Example URL; replace with actual API endpoint
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/4") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: User.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchUsers() -> AnyPublisher<[User], Error> {
            // Example API; replace with actual endpoint
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
                return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
            }

            return URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: [User].self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    
}
