//
//  BaseViewController.swift
//  Media
//
//  Created by hwijinjeong on 2/4/24.
//
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Base", #function)
        view.backgroundColor = .white
        configHierarchy()
        configLayout()
        configView()
    }
    
    func configHierarchy() {
        print("Base", #function)
    }
    
    func configLayout() {
        print("Base", #function)
    }
    
    func configView() {
        print("Base", #function)
    }

}
