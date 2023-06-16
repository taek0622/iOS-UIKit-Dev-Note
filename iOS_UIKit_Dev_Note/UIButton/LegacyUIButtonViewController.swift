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
        setupButton()
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

    private func setupButton() {
        legacyButton.setTitle("일반", for: .normal)
        legacyButton.setTitle("클릭됨", for: .highlighted)

        legacyButton.setTitleColor(.white, for: .normal)
        legacyButton.setTitleColor(.black, for: .highlighted)

        legacyButton.setImage(UIImage(systemName: "heart"), for: .normal)
        legacyButton.setImage(UIImage(systemName: "heart.fill"), for: .highlighted)

        legacyButton.tintColor = .systemRed

        legacyButton.backgroundColor = .systemBlue
        legacyButton.layer.cornerRadius = 4

        legacyButton.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)

        legacyButton.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc func onClickButton() {
        let alert = UIAlertController(title: "Alert", message: "Legacy Button Clicked", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
