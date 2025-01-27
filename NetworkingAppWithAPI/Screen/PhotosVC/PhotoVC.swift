//
//  PhotoVC.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit

class PhotoVC: BaseVC {
    
    //MARK: UI Elements
    
    private lazy var table: UITableView = {
        let t = UITableView()
        t.dataSource = self
        t.delegate = self
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(PhotoCell.self, forCellReuseIdentifier: "\(PhotoCell.self)")
        
        return t
    }()
    
    let viewModel = PhotoVM()
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getPhotoData {
            self.table.reloadData()
        }
    }
    
    override func configureUI() {
        view.addSubview(table)
        title = "Photos"
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

extension PhotoVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(PhotoCell.self)") as! PhotoCell
        cell.callElement(photoUrl: viewModel.photos[indexPath.row].downloadURL ?? "", title: viewModel.photos[indexPath.row].author ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PhotoDetailVC()
        controller.imageURL = viewModel.photos[indexPath.row].downloadURL ?? ""
        
        navigationController?.present(controller, animated: true)
    }
}
