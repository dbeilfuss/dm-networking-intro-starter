//
//  SampleUserData.swift
//  DMNetworkingIntro
//
//  Created by Daniel Beilfuss on 2/19/24.
//

import Foundation

enum SampleUserData {
    static let sampleUserList: [User] = [
        User(id: 1, email: "d.awesome@gmail.com", firstName: "Dan", lastName: "Awesome", avatar: "coolMan"),
        User(id: 2, email: "g.awesom@gmail.com", firstName: "Ginger", lastName: "Awesome", avatar: "coolWoman"),
        User(id: 3, email: "n.awesome@gmail.com", firstName: "Noah", lastName: "Awesome", avatar: "coolBoy"),
        User(id: 4, email: "m.awesome@gmail.com", firstName: "Micah", lastName: "Awesome", avatar: "coolBoy"),
        User(id: 5, email: "b.awesome@gmail.com", firstName: "Becca", lastName: "Awesome", avatar: "coolGirl")
    ]
}
