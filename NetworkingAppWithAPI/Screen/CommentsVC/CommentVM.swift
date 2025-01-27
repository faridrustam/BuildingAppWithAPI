//
//  CommentVM.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import Foundation
import Alamofire

class CommentVM {
    var comments = [CommentModel]()
    var postId: Int?
    
    func getCommentData(completion: (() -> Void)?) {
        let url = "\(AppFile.baseUrl)/posts/\(postId ?? 0)/comments"
        AF.request(url).responseDecodable(of: [CommentModel].self) { response in
            switch response.result {
            case .success(let items):
                self.comments = items
                completion?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
