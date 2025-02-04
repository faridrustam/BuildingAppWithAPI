//
//  AlbumsVC.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit

class AlbumsVC: BaseVC {
    
    //MARK: UI Elements
    
    private lazy var table: UITableView = {
        let t = UITableView()
        t.dataSource = self
        t.delegate = self
        t.allowsSelection = false
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(PostCell.self, forCellReuseIdentifier: "\(PostCell.self)")
        return t
    }()
    
    let viewModel = AlbumsVM()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAlbumData {
            self.table.reloadData()
        }
    }
    
    override func configureUI() {
        view.addSubview(table)
        title = "Albums"
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

extension AlbumsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(PostCell.self)") as! PostCell
        cell.callElement(titleLabel: viewModel.albums[indexPath.row].title ?? "")
        
        return cell
    }
}
