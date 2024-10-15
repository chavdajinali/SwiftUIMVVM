//
//  User.swift
//  MVVMDemoSwiftUI
//
//  Created by chavda jinali on 15/10/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}
