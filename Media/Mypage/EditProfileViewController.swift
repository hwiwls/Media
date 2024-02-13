//
//  EditProfileViewController.swift
//  Media
//
//  Created by hwijinjeong on 2/14/24.
//

import UIKit

class EditProfileViewController: UIViewController {
    var nicknameSpace: ((String) -> Void)?
    var nameSpace: ((String) -> Void)?
    
    private let nameTextField = UITextField().then {
        $0.textColor = .white
        $0.attributedPlaceholder = NSAttributedString(
            string: "이름",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        )
    }
    
    private let textField = UITextField().then {
        $0.textColor = .white
        $0.attributedPlaceholder = NSAttributedString(
            string: "닉네임",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        )
    }
    
    lazy var confirmBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(confirmBtnClicked), for: .touchUpInside)
    }
    
    @objc func confirmBtnClicked() {
        if let nickname = textField.text {
            nicknameSpace?(nickname)
        }
        
        if let name = nameTextField.text {
            nameSpace?(name)
        }
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        view.addSubview(textField)
        view.addSubview(confirmBtn)
        view.addSubview(nameTextField)
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(30)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.top).offset(30)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(30)
        }
        
        confirmBtn.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
            $0.width.equalTo(70)
        }
    }
    
}
