//
//  UsersVC.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 28.01.25.
//

import UIKit

class UsersVC: BaseVC {
    
    //MARK: UI Elements
    
    private lazy var table: UITableView = {
        let t = UITableView()
        t.dataSource = self
        t.delegate = self
        t.register(PostCell.self, forCellReuseIdentifier: "\(PostCell.self)")
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let viewModel = UsersVM()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getUserData {
            self.table.reloadData()
        }
    }
    
    override func configureUI() {
        view.addSubview(table)
        title = "Users"
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

extension UsersVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(PostCell.self)", for: indexPath) as! PostCell
        cell.callElement(titleLabel: viewModel.users[indexPath.row].name ?? "", bodyLabel: viewModel.users[indexPath.row].email ?? "")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UserDetailVC()
        
        controller.user = viewModel.users[indexPath.row]
        
        navigationController?.show(controller, sender: nil)
    }
}
