//
//  UsersViewController.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/10/23.
//

import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    
    var users: [User] = []
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
        configureTableView()
    }
    
    func getUsers() {
        networkManager.getUsers() {
            let result = $0
            switch result {
            case .success(let usersArray):
                self.users = usersArray
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func configureTableView () {
        usersTableView.dataSource = self
        usersTableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: Constants.userCellReuseID)
    }

}

//MARK: - TableView Extentions

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersTableView.dequeueReusableCell(withIdentifier: Constants.userCellReuseID, for: indexPath) as! UserCell
        let thisUser = users[indexPath.row]
        cell.set(thisUser)
        return cell
    }
    
}
