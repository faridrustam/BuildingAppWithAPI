//
//  UserDetailVC.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 28.01.25.
//

import UIKit

class UserDetailVC: BaseVC {
    
    //MARK: UI Elements
    
    private let userNameLabel: UILabel = {
        let l = UILabel()
        l.text = "User Name"
        l.font = .systemFont(ofSize: 16, weight: .regular)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private let emailLabel: UILabel = {
        let l = UILabel()
        l.text = "Email"
        l.font = .systemFont(ofSize: 16, weight: .regular)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private let phoneNumberLabel: UILabel = {
        let l = UILabel()
        l.text = "Phone Number"
        l.font = .systemFont(ofSize: 16, weight: .regular)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private let companyNameLabel: UILabel = {
        let l = UILabel()
        l.text = "Company Name"
        l.font = .systemFont(ofSize: 16, weight: .regular)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private let addressLabel: UILabel = {
        let l = UILabel()
        l.text = "Address"
        l.font = .systemFont(ofSize: 16, weight: .regular)
        l.textColor = .black
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [userNameLabel, emailLabel, phoneNumberLabel, companyNameLabel, addressLabel])
        sv.axis = .vertical
        sv.spacing = 12
        sv.distribution = .equalCentering
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    var user: UserModel?
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureUI() {
        view.addSubview(stackView)
        configureData()
        title = user?.name
    }
    
    override func configureConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureData() {
        userNameLabel.text = "Username: \(user?.username ?? "")"
        emailLabel.text = "Email: \(user?.email ?? "")"
        phoneNumberLabel.text = "Phone: \(user?.phone ?? "")"
        companyNameLabel.text = "Company: \(user?.company?.name ?? "")"
        addressLabel.text = "Address: \(user?.address?.street ?? ""), \(user?.address?.suite ?? ""), \(user?.address?.city ?? ""), \(user?.address?.zipcode ?? "")"
    }
}
