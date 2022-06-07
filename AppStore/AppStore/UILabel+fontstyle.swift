//
//  UILabel+fontstyle.swift
//  AppStore
//
//  Created by 리아 on 2022/06/07.
//

import UIKit

extension UILabel {

    enum FontType {
        case title
        case largeTitle
        case subtitle
        case description
        case appTitle
        case appSubtitle
        case appDesctiption
    }

    func applyFontStyle(_ type: FontType, isDark: Bool) {
        self.textColor = .systemGray

        switch type {
        case .title:
            self.textColor = isDark ? .label : .blackLabel
            self.font = UIFont.systemFont(ofSize: 29, weight: .bold)
            self.numberOfLines = 3
        case .largeTitle:
            self.textColor = isDark ? .label : UIColor.blackLabel
            self.font = UIFont.systemFont(ofSize: 44, weight: .black)
            self.numberOfLines = 3
        case .subtitle:
            self.textColor = isDark ? .systemGray : .grayLabel
            self.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        case .description:
            self.textColor = isDark ? .systemGray : .grayLabel
            self.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        case .appTitle:
            self.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        case .appSubtitle:
            self.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        case .appDesctiption:
            self.font = UIFont.systemFont(ofSize: 13.5, weight: .regular)
        }
    }

}
