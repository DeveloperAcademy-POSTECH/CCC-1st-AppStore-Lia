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
    private var imageView = UIImageView()
    private var titleBackgroundView = UIView()

    private let viewPadding: CGFloat = 15

    enum Position {
        case top
        case middle
        case bottom
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .secondarySystemGroupedBackground
        view.addSubview(imageView)
        view.addSubview(titleBackgroundView)
        view.addSubview(subtitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setTopic(titlePosition: Position, title: String, subtitle: String?, description: String?, isDark: Bool) {
        titleLabel.text = title

        if let description = description {
            setDescription(description: description)
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

    private func setDescription(description: String) {
        descriptionLabel.text = description
        descriptionLabel.applyFontStyle(.description, isDark: true)

        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewPadding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -viewPadding),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10)
        ])
    }

    func setImage(with imageName: String, position: Position) {
        guard let image = UIImage(named: imageName) else { return }
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        titleBackgroundView.backgroundColor = .secondarySystemGroupedBackground

        switch position {
        case .top:
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: view.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                titleBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                titleBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                titleBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                titleBackgroundView.topAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -10)
            ])
        case .middle:
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: view.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        case .bottom:
            NSLayoutConstraint.activate([
                titleBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
                titleBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                titleBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                titleBackgroundView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                imageView.topAnchor.constraint(equalTo: titleBackgroundView.bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }

}
