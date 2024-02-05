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

class DetailViewController: BaseViewController {
    
    var movieId = 0
    
    var movieImg: UIImage?
    
    lazy var imageView = UIImageView().then {
        $0.image = movieImg
        $0.contentMode = .scaleToFill
    }
    
    private let seriesNameLabel = UILabel().then {
        $0.text = "시리즈 이름입니다"
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .white
        $0.textAlignment = .left
    }
    
    private let overviewLabel = UILabel().then {
        $0.text = "개요입니다"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .white
        $0.textAlignment = .left
        $0.numberOfLines = 3
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
    
    private let recommendLabel = UILabel().then {
        $0.text = "비슷한 콘텐츠를 추천해드릴게요"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .white
        $0.textAlignment = .left
    }
    
    lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = 70
        $0.backgroundColor = .clear
        $0.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
    }
    
    lazy var imageList: RecommendModel = RecommendModel(results: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        print(movieId)
        configHierarchy()
        configLayout()
        configNav()
        
        let group = DispatchGroup()

//        group.enter()
//        TMDBAPIManager.shared.fetchSeriesDetail(api: .detail(id: movieId)) { result in
//            let imagePath = "https://image.tmdb.org/t/p/w500\(result.backdropPath)"
//            if let url = URL(string: imagePath) {
//                self.imageView.kf.setImage(with: url)
//            }
//            self.seriesNameLabel.text = result.name
//            self.overviewLabel.text = result.overview
//            group.leave()
//        }
        
        TMDBSessionManager.shared.fetchSeriesDetailS(id: movieId) { detail, error in
            if error == nil {
                guard let detail = detail else { return }
                let imagePath = "https://image.tmdb.org/t/p/w500\(detail.backdropPath)"
                if let url = URL(string: imagePath) {
                    self.imageView.kf.setImage(with: url)
                    self.seriesNameLabel.text = detail.name
                    self.overviewLabel.text = detail.overview
                }
            } else {
                
            }
        }

        group.enter()
        TMDBAPIManager.shared.fetchSeriesCast(api: .cast(id: movieId)) { result in
            var actingNames: [String] = []
            var creatorNames: [String] = []

            result.cast.reduce(into: ()) { _, cast in
                actingNames.append(cast.name)
            }

            result.crew.reduce(into: ()) { _, cast in
                switch cast.department {
                case .creator, .directing:
                    creatorNames.append(cast.name)
                default:
                    break
                }
            }

            self.castNameLabel.text = actingNames.joined(separator: ", ")
            self.crewNameLabel.text = creatorNames.joined(separator: ", ")
            group.leave()
        }

        group.enter()
        TMDBAPIManager.shared.fetchRecommendedSeries(api: .recommend(id: movieId)) { result in
            self.imageList = result
            group.leave()
        }

        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    override func configHierarchy() {
        view.addSubviews([
            imageView,
            seriesNameLabel,
            overviewLabel,
            castNameLabel,
            crewNameLabel,
            recommendLabel,
            tableView
        ])
    }
    
    override func configLayout() {
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        seriesNameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(20)
        }
        
        overviewLabel.snp.makeConstraints {
            $0.top.equalTo(seriesNameLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.lessThanOrEqualTo(60)
        }
        
        castNameLabel.snp.makeConstraints {
            $0.top.equalTo(overviewLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(16)
        }
        
        crewNameLabel.snp.makeConstraints {
            $0.top.equalTo(castNameLabel.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(16)
        }
        
        recommendLabel.snp.makeConstraints {
            $0.top.equalTo(crewNameLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    
    func configNav() {
        navigationItem.title = "에피소드"
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageList.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
       
        let item = imageList.results[indexPath.row]

        // 옵셔널 바인딩을 사용하여 안전하게 URL을 생성
        if let backdropPath = item.backdrop_path {
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath)")
            cell.backdropImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
        } else {
            // url 생성 실패 처리. 이 경우 placeholder 이미지를 설정해줍니다.
            cell.backdropImageView.image = UIImage(systemName: "star.fill")
        }

        cell.seriesNameLabel.text = item.name
        
        return cell
    }
}
