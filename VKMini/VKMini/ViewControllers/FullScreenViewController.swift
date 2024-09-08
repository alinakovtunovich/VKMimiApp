//
//  FullScreenViewController.swift
//  VKMini
//
//  Created by Аlina Кovtunovich on 08.09.2024.
//

import UIKit

class FullScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupFullScreenView()
    }

    private func setupFullScreenView() {
        let label = UILabel()
        label.text = "Полное взаимодействие с приложением"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
