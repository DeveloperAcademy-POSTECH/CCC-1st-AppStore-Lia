//
//  TodayViewController.swift
//  AppStore
//
//  Created by 리아 on 2022/06/01.
//

import UIKit

final class TodayViewController: UIViewController {

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "\n6월 4일 토요일" // 줄바꿈 - navigation.title과 더 가깝게 보내기 위함
        label.numberOfLines = 2
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 35, height: 35)
        button.setImage(UIImage(named: "LiaProfile"), for: .normal) // Object Literal Violation Warning...
        button.layer.cornerRadius = button.frame.size.width / 2
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setNavigationBar()
        setChildViewController()
    }

    private func setNavigationBar() {
        navigationItem.title = "투데이"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: dateLabel)
        navigationItem.titleView = profileButton
        setNavigationConstraint()
    }

    private func setNavigationConstraint() {
        let layoutCriteriaView: UIView = navigationController?.navigationBar ?? view

        NSLayoutConstraint.activate([
            profileButton.trailingAnchor.constraint(equalTo: layoutCriteriaView.trailingAnchor,
                                                    constant: -13),
            profileButton.topAnchor.constraint(equalTo: layoutCriteriaView.topAnchor, constant: 50),
            profileButton.widthAnchor.constraint(equalToConstant: 35),
            profileButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

    private func setChildViewController() {
        let introductionViewController = createAIntroView()

        addChild(introductionViewController)
        view.addSubview(introductionViewController.view)
        introductionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        introductionViewController.didMove(toParent: self)

        NSLayoutConstraint.activate([
            introductionViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            introductionViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            introductionViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            introductionViewController.view.heightAnchor.constraint(equalToConstant: 400)
        ])
    }

    private func createAIntroView() -> IntroductionViewController {
        let introView = IntroductionViewController()

        introView.setTopic(titlePosition: .bottom,
                           title: "Microsoft Office",
                           subtitle: "추천 앱",
                           description: "모바일에 최적화된 오피스 앱을 만나보세요.",
                           isDark: true)
        introView.setImage(with: "micro.jpeg", position: .top)

        introView.view.layer.cornerRadius = 15
        introView.view.layer.masksToBounds = true
        return introView
    }

}
