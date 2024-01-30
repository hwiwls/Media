//
//  TrendingCollectionViewCell.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    let posterImageView = PosterImageView(frame: .zero)
    let titleLabel = WhiteTextLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
    }
    
    func configureLayout() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(contentView)
            make.height.equalTo(20)
        }
    }
    
    func configureView() {
        posterImageView.image = UIImage(systemName: "person")
        titleLabel.text = "테스트"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
