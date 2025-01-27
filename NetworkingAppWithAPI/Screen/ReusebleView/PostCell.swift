//
//  PostCell.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit

class PostCell: UITableViewCell {
    
    //MARK: UI Elements

    private let title: UILabel = {
        let t = UILabel()
        t.textColor = .black
        t.numberOfLines = 0
        t.font = .systemFont(ofSize: 17)
        t.translatesAutoresizingMaskIntoConstraints = false
        
        return t
    }()
    
    private let body: UILabel = {
        let b = UILabel()
        b.textColor = .gray
        b.font = .systemFont(ofSize: 15)
        b.numberOfLines = 0
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }()
    
    //MARK: - Life cycle
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
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
        addSubview(title)
        addSubview(body)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            body.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            body.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            body.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
    }
    
    func callElement(titleLabel: String, bodyLabel: String) {
        title.text = titleLabel
        body.text = bodyLabel
    }
}
