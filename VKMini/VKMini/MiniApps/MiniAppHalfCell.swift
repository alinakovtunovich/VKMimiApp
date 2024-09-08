//
//  MiniAppHalfCell.swift
//  VKMini
//
//  Created by Аlina Кovtunovich on 08.09.2024.
//

import UIKit

class MiniAppHalfCell: UITableViewCell {

    private var moreButton = UIButton()
    private var appNameLabel = UILabel()
    private var viewControllerType: UIViewController.Type?

    func configure(with appName: String, viewControllerType: UIViewController.Type, navigationController: UINavigationController?) {
        appNameLabel.text = appName
        appNameLabel.textAlignment = .center
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(appNameLabel)

        self.viewControllerType = viewControllerType 

        moreButton.setTitle("Подробнее", for: .normal)
        moreButton.backgroundColor = .systemGreen
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(moreButton)

        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            appNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            appNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            appNameLabel.heightAnchor.constraint(equalToConstant: 100),
            
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            moreButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moreButton.widthAnchor.constraint(equalToConstant: 150),
            moreButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        moreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
    }

    @objc private func moreButtonTapped() {
        if let viewControllerType = viewControllerType {
            let fullScreenVC = viewControllerType.init()
            if let navigationController = window?.rootViewController as? UINavigationController {
                navigationController.pushViewController(fullScreenVC, animated: true)
            }
        }
    }
}
