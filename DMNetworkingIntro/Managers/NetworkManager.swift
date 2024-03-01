//
//  NetworkManager.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/10/23.
//

import Foundation

//protocol NetworkManagerDelegate {
//    func usersRetrieved(_ userList: [User]) -> Void
//}

class NetworkManager {
    private let baseUrl = "https://reqres.in/api/"
    
//    var delegate: NetworkManagerDelegate?
    
//    init(delegate: NetworkManagerDelegate) {
//        self.delegate = delegate
//    }
    
    /*
     You'll be building off the projected you created in part one.

     Add the provided DMError file to the Utilities folder.

     2.1 Modify the getUsers function to accept a completion closure. The closure should accept a Result. For the success case, the associated value for the result should be an array of User. For the failure case, the associated value should be a DMError.
     2.2 Continue to modify getUsers to use the closure. For all failures, call the completion closure with the correct DMError. For a success, call the completion closure with the array of User.

     3.1 Modify the UsersViewController to use the completion closure instead of the NetworkManagerDelegate.
     3.2 Add a function called presentAlert to the UsersViewController that accepts a DMError and presents a UIAlertController with that error. Call presentError if there's a failure.
     */
    
    func getUsers(completion: @escaping (Result <[User], Error>) -> Void ) {
                
        let urlString = "\(baseUrl)users"
        performRequest(urlString, completion: completion)
         
    }
    
    func performRequest (_ urlString: String, completion: @escaping (Result<[User], Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(DMError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(DMError.unableToComplete))
                return
            }
            
            guard let data = data else {
                completion(.failure(DMError.invalidData))
                return
            }
            
            do {
                let result = self.parseJSON(data: data)
                switch result {
                case .success(let users):
                    completion(.success(users))
                case .failure(_):
                    completion(.failure(DMError.unableToComplete))
                }
            }
        }
        
        task.resume()
        
    }
    
    func parseJSON(data: Data) -> Result<[User], Error> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedData = try decoder.decode(UserResponse.self, from: data)
            return .success(decodedData.data)
        } catch {
            return .failure(error)
        }
    }
    
}
