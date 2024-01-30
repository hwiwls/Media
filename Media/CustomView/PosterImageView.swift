//
//  PosterImageView.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import UIKit

class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        contentMode = .scaleAspectFill
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
