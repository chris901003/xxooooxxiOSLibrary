// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/3/7.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public protocol XOSearchBarViewDelegate: AnyObject {
    func searchAction(text: String)
}

public class XOSearchBarView: UIView {
    let boxContent = UIView()
    let searchIcon = UIImageView()
    let sepLine = UIView()
    let searchBar = UITextField()
    let sendButton = XOPaddedImageView(
        padding: .init(top: 12, left: 12, bottom: 12, right: 12),
        image: UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    )

    public weak var delegate: XOSearchBarViewDelegate?

    public init() {
        super.init(frame: .zero)
        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        sendButton.layer.cornerRadius = sendButton.bounds.width / 2
    }

    private func setup() {
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))

        boxContent.layer.borderWidth = 2.5
        boxContent.layer.cornerRadius = 15.0
        boxContent.layer.borderColor = UIColor.black.cgColor

        searchIcon.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        searchIcon.contentMode = .scaleAspectFit

        sepLine.backgroundColor = .systemGray5

        searchBar.placeholder = "搜尋內容"
        searchBar.textAlignment = .left
        searchBar.font = .systemFont(ofSize: 18, weight: .semibold)
        searchBar.clearButtonMode = .whileEditing
        searchBar.delegate = self

        sendButton.backgroundColor = .black
        sendButton.clipsToBounds = true
    }

    private func layout() {
        addSubview(boxContent)
        boxContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            boxContent.topAnchor.constraint(equalTo: topAnchor),
            boxContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            boxContent.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        boxContent.addSubview(searchIcon)
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchIcon.leadingAnchor.constraint(equalTo: boxContent.leadingAnchor, constant: 12),
            searchIcon.topAnchor.constraint(equalTo: boxContent.topAnchor, constant: 12),
            searchIcon.bottomAnchor.constraint(equalTo: boxContent.bottomAnchor, constant: -12),
            searchIcon.widthAnchor.constraint(equalTo: searchIcon.heightAnchor)
        ])

        boxContent.addSubview(sepLine)
        sepLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sepLine.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 12),
            sepLine.widthAnchor.constraint(equalToConstant: 2),
            sepLine.topAnchor.constraint(equalTo: boxContent.topAnchor),
            sepLine.bottomAnchor.constraint(equalTo: boxContent.bottomAnchor)
        ])

        boxContent.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: sepLine.trailingAnchor, constant: 6),
            searchBar.trailingAnchor.constraint(equalTo: boxContent.trailingAnchor, constant: -6),
            searchBar.topAnchor.constraint(equalTo: boxContent.topAnchor, constant: 12),
            searchBar.bottomAnchor.constraint(equalTo: boxContent.bottomAnchor, constant: -12)
        ])

        addSubview(sendButton)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendButton.leadingAnchor.constraint(equalTo: boxContent.trailingAnchor, constant: 12),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            sendButton.topAnchor.constraint(equalTo: topAnchor),
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            sendButton.widthAnchor.constraint(equalTo: sendButton.heightAnchor)
        ])
    }
}

extension XOSearchBarView {
    @objc private func tapAction() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            self?.sendButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { [weak self] _ in
            UIView.animate(withDuration: 0.1) {
                self?.sendButton.transform = .identity
            }
        }
        searchBar.resignFirstResponder()
    }
}

// MARK: - UITextFieldDelegate
extension XOSearchBarView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.searchAction(text: textField.text ?? "")
    }
}
