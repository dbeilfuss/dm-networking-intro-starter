//
//  UsersViewController.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/10/23.
//

import UIKit

/**
 1. Create the user interface. See the provided screenshot for how the UI should look.
 2. Follow the instructions in the `User` file.
 3. Follow the instructions in the `NetworkManager` file.
 */

class UsersViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!

    /**
     4. Create a variable called `users` and set it to an empty array of `User` objects.
     */
    
    var users: [User] = []
    var networkManager: NetworkManager?
    
    /**
     5. Connect the UITableView to the code. Create a function called `configureTableView` that configures the table view. You may find the `Constants` file helpful. Make sure to call the function in the appropriate spot.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
        configureTableView()
    }
    
    func getUsers() {
//        users = SampleUserData.sampleUserList
        networkManager = NetworkManager(delegate: self)
        networkManager?.getUsers()
    }
    
    func configureTableView () {
        usersTableView.dataSource = self
        usersTableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: Constants.userCellReuseID)
    }
    
    /**
     6.1 Set the `NetworkManager`'s delegate property to the `UsersViewController`. Have the `UsersViewController` conform to the `NetworkManagerDelegate` protocol. Call the `NetworkManager`'s `getUsers` function. In the `usersRetrieved` function, assign the `users` property to the array we got back from the API and call `reloadData` on the table view.
     */
//    func getUsers() {
//        
//    }
}

//MARK: - TableView Extentions

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersTableView.dequeueReusableCell(withIdentifier: Constants.userCellReuseID, for: indexPath) as! UserCell
        let thisUser = users[indexPath.row]
        print (thisUser)
        cell.set(thisUser)
        return cell
    }
    
    
}


//MARK: - UserDisplay Extension

extension UsersViewController: NetworkManagerDelegate {
    
    func usersRetrieved(_ userList: [User]) {
        users = userList
    }
    
}
