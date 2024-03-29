//
//  ViewController.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import UIKit
import SnapKit
import Kingfisher

class ContentOverviewViewController: BaseViewController {
    
    let tableView = UITableView()
    
    let tableViewTitle = ["주간 트렌드", "조회수 높은", "인기있는"]
    
    var imageList: TVSeriesModel = TVSeriesModel(results: [])
    var imageList2: TVSeriesModel = TVSeriesModel(results: [])
    var imageList3: TVSeriesModel = TVSeriesModel(results: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configHierarchy()
        configLayout()
        configView()
        
        
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPIManager.shared.fetchTVSeries(api: .trend) { results in
                self.imageList = results
                group.leave()
            }
        }
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPIManager.shared.fetchTVSeries(api: .topRated) { results in
                self.imageList2 = results
                group.leave()
            }
        }
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPIManager.shared.fetchTVSeries(api: .popular) { results in
                self.imageList3 = results
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    override func configHierarchy() {
        view.addSubviews([
            tableView
        ])
    }
    
    override func configLayout() {
        tableView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 260
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(ContentOverviewTableViewCell.self, forCellReuseIdentifier: "ContentOverviewTableViewCell")
    }
}

extension ContentOverviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentOverviewTableViewCell", for: indexPath) as! ContentOverviewTableViewCell
        
        cell.selectionStyle = .none
        
        cell.trendingCollectionView.delegate = self
        cell.trendingCollectionView.dataSource = self
        cell.trendingCollectionView.register(ContentsCollectionViewCell.self, forCellWithReuseIdentifier: "ContentsCollectionViewCell")
        cell.trendingCollectionView.tag = indexPath.row
        cell.trendingCollectionView.reloadData()
        
        cell.titleLabel.text = tableViewTitle[indexPath.row]
        
        return cell
    }
}

extension ContentOverviewViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return imageList.results.count
        } else if collectionView.tag == 1 {
            return imageList2.results.count
        } else {
            return imageList3.results.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentsCollectionViewCell", for: indexPath) as! ContentsCollectionViewCell
        if collectionView.tag == 0 {
            let item = imageList.results[indexPath.item]
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.poster_path)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            cell.titleLabel.text = imageList.results[indexPath.item].name
            cell.tag = item.id
        } else if collectionView.tag == 1 {
            let item = imageList2.results[indexPath.item]
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.poster_path)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            cell.titleLabel.text = imageList2.results[indexPath.item].name
            cell.tag = item.id
        } else {
            let item = imageList3.results[indexPath.item]
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.poster_path)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            cell.titleLabel.text = item.name
            cell.tag = item.id
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! ContentsCollectionViewCell
        let id = cell.tag

        let detailVC = DetailViewController()
        detailVC.movieId = id
        detailVC.movieImg = cell.posterImageView.image 
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
