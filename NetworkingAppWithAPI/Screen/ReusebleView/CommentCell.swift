//
//  CommentCell.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit

class CommentCell: UITableViewCell {
    
    //MARK: UI Elements
    
    private let name: UILabel = {
        let n = UILabel()
        n.textColor = .black
        n.numberOfLines = 0
        n.font = .systemFont(ofSize: 17)
        n.translatesAutoresizingMaskIntoConstraints = false
        
        return n
    }()
    
    private let email: UILabel = {
       let e = UILabel()
        e.textColor = .gray
        e.numberOfLines = 0
        e.font = .systemFont(ofSize: 15)
        e.translatesAutoresizingMaskIntoConstraints = false
        
        return e
    }()
    
    private let body: UILabel = {
        let b = UILabel()
        b.textColor = .black
        b.numberOfLines = 0
        b.font = .systemFont(ofSize: 15)
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
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
        [name,
         email,
         body].forEach({ addSubview($0) })
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            email.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            email.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            
            body.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 4),
            body.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            body.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            body.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
    }
    
    func callElement(nameLabel: String, emailLabel: String, bodyLabel: String) {
        name.text = nameLabel
        email.text = emailLabel
        body.text = bodyLabel
    }
}
