//
//  UIView+addSubViews.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}
