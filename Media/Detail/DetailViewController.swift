//
//  DetailViewController.swift
//  Media
//
//  Created by hwijinjeong on 1/31/24.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class DetailViewController: UIViewController {
    
    var movieId = 0
    
    var movieImg: UIImage?
    
    lazy var imageView = UIImageView().then {
        $0.image = movieImg
        $0.contentMode = .scaleToFill
    }
    
    private let castNameLabel = UILabel().then {
        $0.text = "배우 이름입니다"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
        $0.textAlignment = .left
    }
    
    private let crewNameLabel = UILabel().then {
        $0.text = "크리에이터 이름입니다"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
        $0.textAlignment = .left
    }
    
    lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = 150
        $0.backgroundColor = .clear
        $0.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
    }
    
    lazy var imageList: DetailModel = DetailModel(id: movieId, seasons: [], last_episode_to_air: nil, next_episode_to_air: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        print(movieId)
        configHierarchy()
        configLayout()
        configView()
        configNav()
        
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPIManager.shared.fetchSeriesDetail2(id: self.movieId)
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPIManager.shared.fetchSeriesDetail(id: self.movieId) { results in
                self.imageList = results
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
        
    }
    
    func configHierarchy() {
        view.addSubviews([
            imageView,
            castNameLabel,
            crewNameLabel,
            tableView
        ])
    }
    
    func configLayout() {
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        castNameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(20)
        }
        
        crewNameLabel.snp.makeConstraints {
            $0.top.equalTo(castNameLabel.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(20)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(crewNameLabel.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configView() {
        
    }
    
    func configNav() {
        navigationItem.title = "에피소드"
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell

        var stillPath: String?

            if indexPath.row == 0 {
                stillPath = self.imageList.next_episode_to_air?.still_path
            } else if indexPath.row == 1 {
                stillPath = self.imageList.last_episode_to_air?.still_path
                
            }

            if let stillPath = stillPath {
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(stillPath)")
                cell.stillImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            } else {
                cell.stillImageView.image = UIImage(systemName: "star.fill")
            }

            return cell
        }
    
    
}
