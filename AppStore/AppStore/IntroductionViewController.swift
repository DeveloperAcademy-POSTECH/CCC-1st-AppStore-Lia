//
//  IntroductionViewController.swift
//  AppStore
//
//  Created by 리아 on 2022/06/05.
//

import UIKit

final class IntroductionViewController: UIViewController {

    private var subtitleLabel = UILabel()
    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()

    private let viewPadding: CGFloat = 15

    enum Position {
        case top
        case middle
        case bottom
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemGroupedBackground
        view.addSubview(subtitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func setTopic(titlePosition: Position, title: String, subtitle: String?, description: String?, isDark: Bool) {
        titleLabel.text = title

        if let description = description {
            setDescription(description: description, isDark: isDark)
        }

        switch titlePosition {
        case .top:
            if let subtitle = subtitle {
                subtitleLabel.text = subtitle
            }
            subtitleLabel.applyFontStyle(.subtitle, isDark: isDark)
            titleLabel.applyFontStyle(.title, isDark: isDark)

            NSLayoutConstraint.activate([
                subtitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
                subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewPadding),
                subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -viewPadding),
                subtitleLabel.heightAnchor.constraint(equalToConstant: 20),
                titleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 5),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewPadding),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10)
            ])

        case .middle:
            titleLabel.applyFontStyle(.largeTitle, isDark: isDark)

            NSLayoutConstraint.activate([
                titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewPadding),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -190),
                titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10)
            ])

        case .bottom:
            if let subtitle = subtitle {
                subtitleLabel.text = subtitle
            }
            subtitleLabel.applyFontStyle(.subtitle, isDark: isDark)
            titleLabel.applyFontStyle(.title, isDark: isDark)

            NSLayoutConstraint.activate([
                titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -5),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewPadding),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: viewPadding),
                titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
                subtitleLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -3),
                subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewPadding),
                subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: viewPadding),
                subtitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10)
            ])
        }
    }

    private func setDescription(description: String, isDark: Bool) {
        descriptionLabel.text = description
        descriptionLabel.applyFontStyle(.description, isDark: isDark)

        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewPadding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -viewPadding),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10)
        ])
    }

}
