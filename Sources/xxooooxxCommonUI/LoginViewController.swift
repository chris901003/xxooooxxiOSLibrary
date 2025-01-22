// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/1/22.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit
import AuthenticationServices
import GoogleSignIn

public protocol XOLoginViewControllerDelegate: AnyObject {
    func appleSignInAction()
    func googleSignInAction()
}

public class XOLoginViewController: UIViewController {
    let mainContentView = UIView()
    let titleLabel = UILabel()
    let appleSignInButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    let googleSignInButton = GIDSignInButton()

    public weak var delegate: XOLoginViewControllerDelegate?

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }

    private func setup() {
        view.backgroundColor = .white

        titleLabel.text = "Login"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1

        appleSignInButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(appleSignInAction)))

        googleSignInButton.style = .wide
        googleSignInButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(googleSignInAction)))
    }

    private func layout() {
        view.addSubview(mainContentView)
        mainContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainContentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        mainContentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: mainContentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor)
        ])

        mainContentView.addSubview(appleSignInButton)
        appleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appleSignInButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            appleSignInButton.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 32),
            appleSignInButton.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -32),
            appleSignInButton.heightAnchor.constraint(equalToConstant: 45)
        ])

        mainContentView.addSubview(googleSignInButton)
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            googleSignInButton.topAnchor.constraint(equalTo: appleSignInButton.bottomAnchor, constant: 12),
            googleSignInButton.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 32),
            googleSignInButton.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -32),
            googleSignInButton.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor)
        ])
    }

    @objc private func appleSignInAction() {
        delegate?.appleSignInAction()
    }

    @objc private func googleSignInAction() {
        delegate?.googleSignInAction()
    }
}
