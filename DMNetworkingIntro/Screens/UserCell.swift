//
//  UserCell.swift
//  DMNetworkingIntro
//
//  Created by Daniel Beilfuss on 2/19/24.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    func set (_ user: User) {
        firstNameLabel.text = user.first_name
        emailLabel.text = user.email
    }
    
}
