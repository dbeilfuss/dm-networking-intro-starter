//
//  SampleUserData.swift
//  DMNetworkingIntro
//
//  Created by Daniel Beilfuss on 2/19/24.
//

import Foundation

enum SampleUserData {
    static let sampleUserList: [User] = [
        User(id: 1, email: "d.awesome@gmail.com", first_name: "Dan", last_name: "Awesome", avatar: "coolMan"),
        User(id: 2, email: "g.awesom@gmail.com", first_name: "Ginger", last_name: "Awesome", avatar: "coolWoman"),
        User(id: 3, email: "n.awesome@gmail.com", first_name: "Noah", last_name: "Awesome", avatar: "coolBoy"),
        User(id: 4, email: "m.awesome@gmail.com", first_name: "Micah", last_name: "Awesome", avatar: "coolBoy"),
        User(id: 5, email: "b.awesome@gmail.com", first_name: "Becca", last_name: "Awesome", avatar: "coolGirl")
    ]
}
