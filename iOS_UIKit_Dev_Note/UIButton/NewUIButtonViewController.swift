//
//  NewUIButtonViewController.swift
//  iOS_UIKit_Dev_Note
//
//  Created by 김민택 on 2023/06/09.
//

import UIKit

class NewUIButtonViewController: UIViewController {

    // MARK: - View

    private lazy var newButton = UIButton()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }

    // MARK: - Method

    private func attribute() {
        view.backgroundColor = .white
    }

    private func layout() {
        view.addSubview(newButton)
        NSLayoutConstraint.activate([
            newButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            newButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
