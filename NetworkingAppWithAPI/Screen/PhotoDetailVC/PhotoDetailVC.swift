//
//  PhotoDetailVC.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 28.01.25.
//

import UIKit

class PhotoDetailVC: BaseVC {
    
    //MARK: UI Elements
    
    private let photo: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    var imageURL: String?
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureUI() {
        view.addSubview(photo)
        photo.frame = view.bounds
        
        photo.sd_setImage(with: URL(string: imageURL ?? ""),
                          placeholderImage: UIImage(systemName: "photo"),
                          options: .highPriority,
                          completed: nil)
        
        title = "Photo Detail"
    }
    
    override func configureConstraint() {
        NSLayoutConstraint.activate([
        photo.topAnchor.constraint(equalTo: view.topAnchor),
        photo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        photo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        photo.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
