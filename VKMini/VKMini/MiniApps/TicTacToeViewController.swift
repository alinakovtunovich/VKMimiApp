//
//  TicTacToeViewController.swift
//  VKMini
//
//  Created by Аlina Кovtunovich on 03.09.2024.
//

import UIKit

class TicTacToeViewController: UIViewController {
    private var buttons = [UIButton]()
    private var currentPlayer = "X"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTicTacToeGrid()
    }

    private func setupTicTacToeGrid() {
        let gridSize = 3
        for row in 0..<gridSize {
            for col in 0..<gridSize {
                let button = UIButton()
                button.setTitle("", for: .normal)
                button.backgroundColor = .lightGray
                button.setTitleColor(.black, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                button.translatesAutoresizingMaskIntoConstraints = false
                button.tag = row * gridSize + col
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                view.addSubview(button)

                let xOffset = CGFloat(col) * 100 + 20
                let yOffset = CGFloat(row) * 100 + 100

                NSLayoutConstraint.activate([
                    button.topAnchor.constraint(equalTo: view.topAnchor, constant: yOffset),
                    button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: xOffset),
                    button.widthAnchor.constraint(equalToConstant: 90),
                    button.heightAnchor.constraint(equalToConstant: 90)
                ])

                buttons.append(button)
            }
        }
    }

    @objc private func buttonTapped(sender: UIButton) {
        guard sender.title(for: .normal) == "" else { return }
        sender.setTitle(currentPlayer, for: .normal)
        currentPlayer = (currentPlayer == "X") ? "O" : "X"
    }
}
