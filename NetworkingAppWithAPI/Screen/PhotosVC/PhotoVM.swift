//
//  PhotoVM.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import Foundation
import Alamofire

class PhotoVM {
    var photos = [PhotoModel]()
    
    func getPhotoData(completion: (() -> Void)?) {
        let url = "https://picsum.photos/v2/list"
        AF.request(url).responseDecodable(of: [PhotoModel].self) { response in
            switch response.result {
            case .success(let items):
                self.photos = items
                completion?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
