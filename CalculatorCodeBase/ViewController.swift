//
//  ViewController.swift
//  CalculatorCodeBase
//
//  Created by 박승환 on 6/21/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var textLable = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        textLableSetting()
    }

    private func textLableSetting() {
        textLable.text = "12345"
        textLable.textColor = .white
        textLable.font = UIFont.boldSystemFont(ofSize: 60)
        textLable.textAlignment = .right
        view.addSubview(textLable)
        
        textLable.snp.makeConstraints{
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
        }
    }

}

