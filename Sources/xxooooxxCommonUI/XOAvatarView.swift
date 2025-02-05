// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/5.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit
import PhotosUI

public protocol XOAvatarViewDelegate: AnyObject {
    func presentPhotoSelector(vc: UIViewController)
    func newAvatar(image: UIImage)
}

public class XOAvatarView: UIView {
    let avatarView = UIImageView()
    public weak var delegate: XOAvatarViewDelegate?

    public init(_ image: UIImage) {
        super.init(frame: .zero)
        avatarView.image = image

        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        avatarView.contentMode = .scaleAspectFill
        avatarView.clipsToBounds = true
        avatarView.isUserInteractionEnabled = true
        avatarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectNewAvatar)))
    }

    private func layout() {
        addSubview(avatarView)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            avatarView.topAnchor.constraint(equalTo: topAnchor),
            avatarView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    @objc private func selectNewAvatar() {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        delegate?.presentPhotoSelector(vc: picker)
    }
}

// MARK: - PHPickerViewControllerDelegate
extension XOAvatarView: PHPickerViewControllerDelegate {
    public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let firstResult = results.first else { return }
        let itemProvider = firstResult.itemProvider
        if itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async {
                    if let selectedImage = image as? UIImage {
                        self?.avatarView.image = selectedImage
                        self?.delegate?.newAvatar(image: selectedImage)
                    }
                }
            }
        }
    }
}
