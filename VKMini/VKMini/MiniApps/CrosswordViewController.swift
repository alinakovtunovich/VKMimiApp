//
//  CrosswordViewController.swift
//  VKMini
//
//  Created by Аlina Кovtunovich on 03.09.2024.
//

import UIKit

class CrosswordViewController: UIViewController {
    private var crosswordGrid = [[UITextField]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCrossword()
    }

    private func setupCrossword() {
        let gridSize = 5
        for row in 0..<gridSize {
            var rowFields = [UITextField]()
            for col in 0..<gridSize {
                let textField = UITextField()
                textField.borderStyle = .roundedRect
                textField.textAlignment = .center
                textField.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(textField)

                let xOffset = CGFloat(col) * 60 + 20
                let yOffset = CGFloat(row) * 60 + 100

                NSLayoutConstraint.activate([
                    textField.topAnchor.constraint(equalTo: view.topAnchor, constant: yOffset),
                    textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: xOffset),
                    textField.widthAnchor.constraint(equalToConstant: 50),
                    textField.heightAnchor.constraint(equalToConstant: 50)
                ])
                rowFields.append(textField)
            }
            crosswordGrid.append(rowFields)
        }
    }
}

