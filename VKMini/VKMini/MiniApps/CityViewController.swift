//
//  CityViewController.swift
//  VKMini
//
//  Created by Аlina Кovtunovich on 08.09.2024.
//

import UIKit
import CoreLocation

class CityViewController: UIViewController, CLLocationManagerDelegate {
    private let cityLabel = UILabel()
    private let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCityView()
        setupLocationManager()
    }

    private func setupCityView() {
        cityLabel.text = "Определение города..."
        cityLabel.textAlignment = .center
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityLabel)

        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        cityLabel.text = "Ваш город: Казань"
    }
}

