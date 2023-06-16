//
//  NewUIButtonViewController.swift
//  iOS_UIKit_Dev_Note
//
//  Created by 김민택 on 2023/06/09.
//

import UIKit

class NewUIButtonViewController: UIViewController {

    // MARK: - Property

    private var buttonConfig = UIButton.Configuration.filled()

    // MARK: - View

    private lazy var newButton = UIButton(configuration: buttonConfig)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }

    // MARK: - Method

    private func attribute() {
        view.backgroundColor = .white
        setupButton()
    }

    private func layout() {
        view.addSubview(newButton)
        NSLayoutConstraint.activate([
            newButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            newButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }

    private func setupButton() {
        buttonConfig.title = "일반"

        buttonConfig.subtitle = "부제목"

        buttonConfig.image = UIImage(systemName: "heart")
        buttonConfig.imagePlacement = .bottom
        buttonConfig.imagePadding = 10

        buttonConfig.buttonSize = .medium

        newButton.translatesAutoresizingMaskIntoConstraints = false
    }
}
