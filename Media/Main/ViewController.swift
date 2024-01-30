//
//  ViewController.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configHierarchy()
        configLayout()
        configView()
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
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        
        return cell
    }
    
    
}

