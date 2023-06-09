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
    private lazy var buttonAction = UIAction { _ in
        self.onClickButton()
    }

    // MARK: - View

    private lazy var newButton = UIButton(configuration: buttonConfig, primaryAction: buttonAction)

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

        newButton.configurationUpdateHandler = { btn in
            switch btn.state {
            case .highlighted:
                btn.configuration?.title = "클릭됨"
                btn.configuration?.image = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            default:
                btn.configuration = self.buttonConfig
            }
        }
    }

    private func onClickButton() {
        let alert = UIAlertController(title: "Alert", message: "New Button Clicked", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
