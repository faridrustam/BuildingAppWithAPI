//
//  ViewController.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit

class PostVC: BaseVC {
    
    //MARK: UI Elements
    
    private lazy var table: UITableView = {
        let t = UITableView()
        t.delegate = self
        t.dataSource = self
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(PostCell.self, forCellReuseIdentifier: "\(PostCell.self)")
        
        return t
    }()
    
    //MARK: - Life cycle
    
    let viewModel = PostVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPostData {
            self.table.reloadData()
        }
    }
    
    override func configureUI() {
        view.addSubview(table)
        table.frame = view.bounds
        title = "Posts"
    }
    
    override func configureConstraint() {
    }
}

extension PostVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(PostCell.self)", for: indexPath) as! PostCell
        cell.callElement(titleLabel: viewModel.posts[indexPath.row].title ?? "",
                         bodyLabel: viewModel.posts[indexPath.row].body ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = CommentVC()
        controller.viewModel.postId = viewModel.posts[indexPath.row].id
        navigationController?.show(controller, sender: nil)
    }
}
