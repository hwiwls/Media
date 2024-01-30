//
//  BlackTextLabel.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import UIKit

class WhiteTextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        font = .boldSystemFont(ofSize: 15)
        textColor = .white
        textAlignment = .left
        numberOfLines = 2
        backgroundColor = .clear
    }
}
