//
//  PhotoCell.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit
import SDWebImage

class PhotoCell: UITableViewCell {
    
    //MARK: UI Elements
    
    private let photo: UIImageView = {
        let p = UIImageView()
        p.translatesAutoresizingMaskIntoConstraints = false
        return p
    }()
    
    private let title: UILabel = {
        let t = UILabel()
        t.font = .systemFont(ofSize: 17, weight: .medium)
        t.textColor = .white
        t.numberOfLines = 0
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    //MARK: - Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureUI() {
        addSubview(photo)
        photo.addSubview(title)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            photo.widthAnchor.constraint(equalToConstant: 300),
            photo.heightAnchor.constraint(equalToConstant: 300),
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            title.leadingAnchor.constraint(equalTo: photo.leadingAnchor, constant: 12),
            title.trailingAnchor.constraint(equalTo: photo.trailingAnchor, constant: -16),
            title.bottomAnchor.constraint(equalTo: photo.bottomAnchor, constant: -12)
        ])
    }
    
    func callElement(photoUrl: String, title: String) {
        self.title.text = title
        self.photo.sd_setImage(with: URL(string: photoUrl),
                               placeholderImage: UIImage(systemName: "photo"),
                               options: .highPriority,
                               completed: nil)
    }
}
