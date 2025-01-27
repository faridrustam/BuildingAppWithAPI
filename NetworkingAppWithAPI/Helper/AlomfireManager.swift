//
//  Alomfire.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import Foundation
import Alamofire

class AlamofireManager {
    enum URLExtension: String, CaseIterable {
        case posts = "/posts"
        case comments = "/comments"
        case albums = "/albums"
        case photos = "/photos"
        case users = "/users"
    }
    
    var posts = [PostModel]()
    var comments = [CommentModel]()
    var albums = [AlbumModel]()
    var photos = [PhotoModel]()
    var users = [UserModel]()
    
    func getPostData(urlExtention: URLExtension, completion: (() -> Void)?) {
        let url = "\(AppFile.baseUrl)\(urlExtention.rawValue)"
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
    
    func getCommentData(urlExtention: URLExtension, completion: (() -> Void)?) {
        let url = "\(AppFile.baseUrl)\(urlExtention.rawValue)"
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
    
    func getAlbumData(urlExtention: URLExtension, completion: (() -> Void)?) {
        let url = "\(AppFile.baseUrl)\(urlExtention.rawValue)"
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
    
    func getPhotoData(urlExtention: URLExtension, completion: (() -> Void)?) {
        let url = "\(AppFile.baseUrl)\(urlExtention.rawValue)"
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
    
    func getUserData(urlExtention: URLExtension, completion: (() -> Void)?) {
        let url = "\(AppFile.baseUrl)\(urlExtention.rawValue)"
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
