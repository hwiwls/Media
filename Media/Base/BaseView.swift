//
//  BaseView.swift
//  Media
//
//  Created by hwijinjeong on 2/4/24.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configHierarchy()
        configLayout()
        configView()
    }
    
    func configHierarchy() { }
    
    func configLayout() { }
    
    func configView() { }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
