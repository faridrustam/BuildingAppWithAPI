//
//  AlbumsVM.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import Foundation
import Alamofire

class AlbumsVM {
    var albums = [AlbumModel]()
    
    func getAlbumData(completion: (() -> Void)?) {
        let url = "\(AppFile.baseUrl)/albums"
        AF.request(url).responseDecodable(of: [AlbumModel].self) { response in
            switch response.result {
            case .success(let items):
                self.albums = items
                completion?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
