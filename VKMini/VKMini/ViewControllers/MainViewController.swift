//
//  MainViewController.swift
//  VKMini
//
//  Created by Аlina Кovtunovich on 03.09.2024.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView = UITableView()
    private let expandButton = UIButton()

    
    private let miniApps: [MiniApp] = [
        MiniApp(name: "Прогноз погоды", viewControllerType: WeatherViewController.self),
        MiniApp(name: "Текущий город", viewControllerType: CityViewController.self),
        MiniApp(name: "Кроссворд", viewControllerType: CrosswordViewController.self),
        MiniApp(name: "Крестики-нолики", viewControllerType: TicTacToeViewController.self),
        MiniApp(name: "Прогноз погоды", viewControllerType: WeatherViewController.self),
        MiniApp(name: "Крестики-нолики", viewControllerType: TicTacToeViewController.self),
        MiniApp(name: "Кроссворд", viewControllerType: CrosswordViewController.self),
        MiniApp(name: "Текущий город", viewControllerType: CityViewController.self),
        MiniApp(name: "Прогноз погоды", viewControllerType: WeatherViewController.self),
        MiniApp(name: "Крестики-нолики", viewControllerType: TicTacToeViewController.self)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupExpandButton()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupExpandButton() {
        expandButton.setTitle("Расширить список", for: .normal)
        expandButton.backgroundColor = .systemBlue
        expandButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(expandButton)

        NSLayoutConstraint.activate([
            expandButton.heightAnchor.constraint(equalToConstant: 50),
            expandButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            expandButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            expandButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        expandButton.addTarget(self, action: #selector(expandButtonTapped), for: .touchUpInside)
    }

    @objc private func expandButtonTapped() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miniApps.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = miniApps[indexPath.row].name
        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 8
    }
}
