//
//  PostVM.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import Foundation
import Alamofire

class PostVM {
    var posts = [PostModel]()
    
    func getPostData(completion: (() -> Void)?) {
        let url = "\(AppFile.baseUrl)/posts"
        AF.request(url).responseDecodable(of: [PostModel].self) { response in
            switch response.result {
            case .success(let items):
                self.posts = items
                completion?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
