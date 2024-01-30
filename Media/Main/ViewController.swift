//
//  ViewController.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    let tableViewTitle = ["주간 트렌드", "조회수 높은", "인기있는"]
    
    var imageList: [TrendingModel] = [
        TrendingModel(results: []),
        TrendingModel(results: []),
        TrendingModel(results: [])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configHierarchy()
        configLayout()
        configView()
        
        TMDBAPIManager.shared.fetchTrendingMovie { results in
            self.imageList[0] = results
            self.tableView.reloadData()
        }
        
    }
    
    func configHierarchy() {
        view.addSubviews([
            tableView
        ])
    }
    
    func configLayout() {
        tableView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 240
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        
        cell.trendingCollectionView.delegate = self
        cell.trendingCollectionView.dataSource = self
        cell.trendingCollectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: "TrendingCollectionViewCell")
        cell.trendingCollectionView.tag = indexPath.row
        cell.trendingCollectionView.reloadData()
        
        cell.titleLabel.text = tableViewTitle[indexPath.row]
        
        return cell
    }
    
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList[collectionView.tag].results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCollectionViewCell", for: indexPath) as! TrendingCollectionViewCell
        
        let item = imageList[collectionView.tag].results[indexPath.item]
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.poster_path)")
        cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
        cell.titleLabel.text = "임시 제목"
        
        return cell
    }
    
    
}
