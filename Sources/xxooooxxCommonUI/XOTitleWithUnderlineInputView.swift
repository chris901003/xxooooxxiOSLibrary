// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/4/3.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public protocol XOTitleWithUnderlineInputDelegate: AnyObject {
    func inputWithUnderline(vc: XOTitleWithUnderlineInputView, text: String)
}

public class XOTitleWithUnderlineInputView: UIView {
    let titleLabel = UILabel()
    let textField = UITextField()
    let bottomLineView = XOExpandingLineView()

    public weak var delegate: XOTitleWithUnderlineInputDelegate?

    public init(title: String, placeholder: String) {
        super.init(frame: .zero)
        setup(title, placeholder)
        layout()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(_ title: String, _ placeholder: String) {
        titleLabel.text = title
        titleLabel.numberOfLines = 1

        textField.placeholder = placeholder
        textField.textAlignment = .center
        textField.delegate = self
        textField.returnKeyType = .done
    }

    private func layout() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)

        addSubview(bottomLineView)
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomLineView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: 2)
        ])
        bottomLineView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}

// MARK: - UITextFieldDelegate
extension XOTitleWithUnderlineInputView: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        delegate?.inputWithUnderline(vc: self, text: textField.text ?? "")
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        DispatchQueue.main.async { [weak self] in
            self?.bottomLineView.startAnimation()
        }
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        DispatchQueue.main.async { [weak self] in
            self?.bottomLineView.retractAnimation()
        }
    }
}
