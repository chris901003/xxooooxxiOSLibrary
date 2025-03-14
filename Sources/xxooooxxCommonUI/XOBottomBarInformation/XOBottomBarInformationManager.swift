// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/21.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit
import xxooooxxCommonFunction

public class XOBottomBarInformationManager {
    private init() { }

    static public func showBottomInformation(type: XOBottomBarInformationType, information: String, duration: Double = 3.0) {
        DispatchQueue.main.async {
            guard let topVC = UIViewController.getTopViewController() else { return }
            let informationView = XOBottomBarInformationView(type, info: information)
            topVC.view.addSubview(informationView)
            informationView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                informationView.bottomAnchor.constraint(equalTo: topVC.view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
                informationView.leadingAnchor.constraint(equalTo: topVC.view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
                informationView.trailingAnchor.constraint(equalTo: topVC.view.safeAreaLayoutGuide.trailingAnchor, constant: -12)
            ])
            
            if duration > 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    informationView.closeAction()
                }
            }
        }
    }
}
