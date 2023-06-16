//
//  LegacyUIButtonViewController.swift
//  iOS_UIKit_Dev_Note
//
//  Created by 김민택 on 2023/06/09.
//

import UIKit

class LegacyUIButtonViewController: UIViewController {

    // MARK: - View

    private let legacyButton = UIButton()

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
        view.addSubview(legacyButton)
        NSLayoutConstraint.activate([
            legacyButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            legacyButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            legacyButton.widthAnchor.constraint(equalToConstant: 80),
            legacyButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
