//
//  UsersVM.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 28.01.25.
//

import Foundation
import Alamofire

class UsersVM {
    var users = [UserModel]()
    
    func getUserData(completion: (() -> Void)?) {
        let url = "\(AppFile.baseUrl)/users"
        AF.request(url).responseDecodable(of: [UserModel].self) { response in
            switch response.result {
            case .success(let items):
                self.users = items
                completion?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
