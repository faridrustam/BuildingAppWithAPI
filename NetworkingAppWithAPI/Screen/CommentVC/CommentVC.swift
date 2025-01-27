//
//  CommentVC.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit

class CommentVC: BaseVC {
    
    //MARK: UI Elements
    
    private lazy var table: UITableView = {
        let t = UITableView()
        t.dataSource = self
        t.delegate = self
        t.showsVerticalScrollIndicator = false
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(CommentCell.self, forCellReuseIdentifier: "\(CommentCell.self)")
        
        return t
    }()
    
    let viewModel = CommentVM()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getCommentData {
            self.table.reloadData()
        }
        
    }
    
    override func configureUI() {
        view.addSubview(table)
    }
    
    override func configureConstraint() {
        NSLayoutConstraint.activate([
        table.topAnchor.constraint(equalTo: view.topAnchor),
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CommentVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CommentCell.self)", for: indexPath) as! CommentCell
        cell.callElement(nameLabel: viewModel.comments[indexPath.row].name ?? "",
                         emailLabel: viewModel.comments[indexPath.row].email ?? "",
                         bodyLabel: viewModel.comments[indexPath.row].body ?? "")
        
        return cell
    }
}
