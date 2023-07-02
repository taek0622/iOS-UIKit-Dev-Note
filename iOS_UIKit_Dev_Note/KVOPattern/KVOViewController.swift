//
//  KVOViewController.swift
//  iOS_UIKit_Dev_Note
//
//  Created by 김민택 on 2023/07/02.
//

import UIKit

class KVOViewController: UIViewController {

    // MARK: - Property

    private var buttonConfig = UIButton.Configuration.filled()
    private lazy var buttonAction = UIAction { _ in
    }

    // MARK: - View

    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private let viewTitleLabel: UILabel = {
        $0.text = "닉네임 변경"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let currentNicknameLabel: UILabel = {
        $0.text = "현재 닉네임:"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let currentNickname: UILabel = {
        $0.text = ""
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let changingNicknameLabel: UILabel = {
        $0.text = "변경할 닉네임:"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let changingNickname: UITextField = {
        $0.placeholder = "변경할 닉네임을 입력해주세요."
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())

    private lazy var submitButton = UIButton(configuration: buttonConfig, primaryAction: buttonAction)

    // MAKR: - Life Cycle

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
        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])

        contentView.addSubview(viewTitleLabel)
        NSLayoutConstraint.activate([
            viewTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        contentView.addSubview(currentNicknameLabel)
        NSLayoutConstraint.activate([
            currentNicknameLabel.topAnchor.constraint(equalTo: viewTitleLabel.bottomAnchor, constant: 32),
            currentNicknameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])

        view.addSubview(currentNickname)
        NSLayoutConstraint.activate([
            currentNickname.topAnchor.constraint(equalTo: currentNicknameLabel.topAnchor),
            currentNickname.leftAnchor.constraint(equalTo: currentNicknameLabel.rightAnchor, constant: 16),
            currentNickname.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])

        view.addSubview(changingNicknameLabel)
        NSLayoutConstraint.activate([
            changingNicknameLabel.topAnchor.constraint(equalTo: currentNicknameLabel.bottomAnchor, constant: 16),
            changingNicknameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])

        view.addSubview(changingNickname)
        NSLayoutConstraint.activate([
            changingNickname.topAnchor.constraint(equalTo: changingNicknameLabel.topAnchor),
            changingNickname.leftAnchor.constraint(equalTo: changingNicknameLabel.rightAnchor, constant: 16),
            changingNickname.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])

        view.addSubview(submitButton)
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: changingNicknameLabel.bottomAnchor, constant: 32),
            submitButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            submitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    private func setupButton() {
        buttonConfig.title = "변경하기"

        buttonConfig.image = UIImage(systemName: "pencil.line")
        buttonConfig.imagePlacement = .trailing
        buttonConfig.imagePadding = 10

        buttonConfig.buttonSize = .medium

        submitButton.configuration = buttonConfig

        submitButton.translatesAutoresizingMaskIntoConstraints = false
    }
}
