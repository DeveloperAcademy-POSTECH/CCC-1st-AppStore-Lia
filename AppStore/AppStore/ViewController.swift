//
//  ViewController.swift
//  AppStore
//
//  Created by 리아 on 2022/06/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        setNavigationBar()
    }

    private func setNavigationBar() {
        self.navigationItem.title = "투데이"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true

        lazy var dateLabel: UILabel = {
            let label = UILabel()
            label.text = "\n6월 4일 토요일" // 줄바꿈 - navigation.title과 더 가깝게 보내기 위함
            label.numberOfLines = 2
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: dateLabel)

        lazy var profileButton: UIButton = {
            let button = UIButton()
            button.frame.size = CGSize(width: 35, height: 35)
            button.setImage(UIImage(named: "LiaProfile"), for: .normal) // Object Literal Violation Warning...
            button.layer.cornerRadius = button.frame.size.width / 2
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        self.navigationItem.titleView = profileButton // profileImageView

        NSLayoutConstraint.activate([
            profileButton.trailingAnchor.constraint(equalTo: navigationController!.navigationBar.trailingAnchor,
                                                    constant: -13),
            profileButton.topAnchor.constraint(equalTo: navigationController!.navigationBar.topAnchor, constant: 50),
            profileButton.widthAnchor.constraint(equalToConstant: 35),
            profileButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

}
