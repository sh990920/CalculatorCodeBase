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
    let numbers = [["7", "8", "9", "+"], ["4", "5", "6", "-"], ["1", "2", "3", "x"], ["AC", "0", "=", "÷"]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        textLableSetting()
        let stackView = createVerticalStackView()
        
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
    
    private func createVerticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.centerX.equalToSuperview()
            make.top.equalTo(textLable.snp.bottom).offset(60)
        }
        var horizontals = Array<UIStackView>()
        for i in numbers {
            let horizontal = createHorizontalStackView(stackView, i)
            horizontals.append(horizontal)
        }
        
        horizontals.forEach{ stackView.addArrangedSubview($0) }
        
        return stackView
    }
    
    private func createHorizontalStackView(_ uiView : UIView, _ numbers: [String]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        uiView.addSubview(stackView)
        for i in numbers {
            let btn = createButton(i)
            stackView.addArrangedSubview(btn)
        }
        stackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.width.equalTo(350)
            $0.centerX.equalToSuperview()
        }
        return stackView
    }
    
    
    private func createButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        if let num = Int(text) {
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        } else {
            button.backgroundColor = .orange
            button.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        }
        button.frame.size.height = 80
        button.frame.size.width = 80
        button.layer.cornerRadius = 40
        return button
    }
    
    @objc func didTapNumberButton(_ sender: UIButton) {
        print("숫자 버튼 누름")
    }
    
    @objc func didTapPlusButton(_ sender: UIButton) {
        print("더하기 버튼 누름")
    }

}
