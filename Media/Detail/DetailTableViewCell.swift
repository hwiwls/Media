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
    
    var episodeNameLabel = UILabel().then {
        $0.text = "에피소드 제목입니다"
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    var overviewLabel = UILabel().then {
        $0.text = "에피소드 개요입니다   \n 에피 \n 소드"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.numberOfLines = 3
    }
    
    var stillImageView = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configHierarchy()
        configLayout()
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configHierarchy() {
        contentView.addSubviews([
            stillImageView,
            episodeNameLabel,
            overviewLabel
        ])
    }
    
    func configLayout() {
        stillImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(12)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
        
        episodeNameLabel.snp.makeConstraints {
            $0.top.equalTo(stillImageView.snp.top).offset(20)
            $0.leading.equalTo(stillImageView.snp.trailing).offset(4)
            $0.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(22)
        }
        
        overviewLabel.snp.makeConstraints {
            $0.top.equalTo(stillImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(90)
        }
    }
    
    func configView() {
    }
    
}
