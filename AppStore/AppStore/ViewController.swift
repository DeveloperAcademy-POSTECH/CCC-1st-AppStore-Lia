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
    }

    private func setNavigationBar() {
        self.navigationItem.title = "투데이"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true

        let dateLabel = UILabel()
        dateLabel.text = "\n6월 4일 토요일" // 줄바꿈 - navigation.title과 더 가깝게 보내기 위함
        dateLabel.numberOfLines = 2
        dateLabel.textColor = .lightGray
        dateLabel.font = UIFont.systemFont(ofSize: 14)

        let dateBarButton = UIBarButtonItem(customView: dateLabel)

        self.navigationItem.leftBarButtonItem = dateBarButton
    }

}
