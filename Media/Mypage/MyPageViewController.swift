//
//  MyPageViewController.swift
//  Media
//
//  Created by hwijinjeong on 2/14/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    private let nameLabel = UILabel().then {
        $0.text = "name"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .white
        $0.textAlignment = .left
    }
    
    private let nicknameLabel = UILabel().then {
        $0.text = "nickname"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .white
        $0.textAlignment = .left
    }
    
    lazy var editBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("수정하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(editBtnClicked), for: .touchUpInside)
    }
    
    @objc func editBtnClicked() {
        let vc = EditProfileViewController()
        vc.nicknameSpace = { value in
            self.nicknameLabel.text = value
        }
        
        vc.nameSpace = { value in
            self.nameLabel.text = value
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        view.addSubview(nameLabel)
        view.addSubview(nicknameLabel)
        view.addSubview(editBtn)
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(20)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(20)
        }
        editBtn.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
            $0.width.equalTo(70)
        }
    }
    

}
