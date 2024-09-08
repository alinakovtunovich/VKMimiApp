//
//  SecondViewController.swift
//  VKMini
//
//  Created by Аlina Кovtunovich on 08.09.2024.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView = UITableView()
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
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MiniAppHalfCell.self, forCellReuseIdentifier: "halfCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return miniApps.count
        }

    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "halfCell", for: indexPath) as! MiniAppHalfCell
            let miniApp = miniApps[indexPath.row]
            cell.configure(with: miniApp.name, viewControllerType: miniApp.viewControllerType, navigationController: navigationController)
            return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }
}

