//
//  WeatherViewController.swift
//  VKMini
//
//  Created by Аlina Кovtunovich on 08.09.2024.
//
import UIKit

class WeatherViewController: UIViewController {
    private let weatherLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupWeatherView()
        fetchWeather()
    }

    private func setupWeatherView() {
        weatherLabel.text = "Загрузка погоды..."
        weatherLabel.textAlignment = .center
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weatherLabel)

        NSLayoutConstraint.activate([
            weatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func fetchWeather() {
        weatherLabel.text = "Прогноз погоды: 25°C, ясно"
    }
}

