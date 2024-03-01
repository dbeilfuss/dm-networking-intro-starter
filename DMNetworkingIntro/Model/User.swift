//
//  User.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/10/23.
//

import Foundation

struct User: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}

struct UserResponse: Codable {
    let data: [User]
}
