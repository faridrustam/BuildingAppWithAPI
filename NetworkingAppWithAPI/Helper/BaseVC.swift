//
//  BaseViewController.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraint()
    }
    
    func configureUI() {}
    func configureConstraint() {}
}
