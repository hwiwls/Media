//
//  DetailTableViewCell.swift
//  Media
//
//  Created by hwijinjeong on 1/31/24.
//

import UIKit
import SnapKit
import Then

class DetailTableViewCell: UITableViewCell {
    
    var seriesNameLabel = UILabel().then {
        $0.text = "시리즈 제목입니다"
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    var backdropImageView = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 15
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configHierarchy()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configHierarchy() {
        contentView.addSubviews([
            backdropImageView,
            seriesNameLabel
        ])
    }
    
    func configLayout() {
        backdropImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(8)
            $0.width.equalTo(100)
        }
        
        seriesNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(backdropImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(20)
        }
    }
}
