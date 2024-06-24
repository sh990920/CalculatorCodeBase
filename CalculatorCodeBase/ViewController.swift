import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var textLabel = UILabel()
    var verticalStackView = UIStackView()
    let numbers = [["7", "8", "9", "+"], ["4", "5", "6", "-"], ["1", "2", "3", "x"], ["AC", "0", "=", "÷"]]
    let calculator = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        textLabelSetting()
        createVerticalStackView()
    }

    private func textLabelSetting() {
        textLabel.text = "0"
        textLabel.textColor = .white
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        textLabel.textAlignment = .right
        view.addSubview(textLabel)
        
        textLabel.snp.makeConstraints{
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
        }
    }
    
    private func createVerticalStackView() {
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        view.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textLabel.snp.bottom).offset(60)
        }
        for i in numbers {
            let horizontal = createHorizontalStackView(i)
            verticalStackView.addArrangedSubview(horizontal)
            horizontal.snp.makeConstraints {
                $0.height.equalTo(80)
                $0.width.equalTo(350)
                $0.centerX.equalToSuperview()
            }
        }
    }
    
    private func createHorizontalStackView(_ numbers: [String]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        for i in numbers {
            let btn = createButton(i)
            stackView.addArrangedSubview(btn)
        }
        return stackView
    }
    
    
    private func createButton(_ text: String) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        if Int(text) != nil {
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.addTarget(self, action: #selector(didTapNumberButton), for: .touchUpInside)
        } else {
            button.backgroundColor = .orange
            button.addTarget(self, action: #selector(didTapOperateButton), for: .touchUpInside)
        }
        button.frame.size.height = 80
        button.frame.size.width = 80
        button.layer.cornerRadius = 40
        return button
    }
    
    @objc func didTapNumberButton(_ sender: UIButton) {
        if let str = textLabel.text, let text = sender.titleLabel?.text {
            if let num = Int(str), num == 0 {
                textLabel.text = text
            } else {
                textLabel.text = str + text
            }
        }
    }
    
    @objc func didTapOperateButton(_ sender: UIButton) {
        if let text = sender.titleLabel?.text {
            switch text {
            case "AC":
                textLabel.text = "0"
            case "=":
                if let expression = textLabel.text, let result = calculator.calculate(expression: expression) {
                    textLabel.text = String(result)
                }
            default:
                if let textLabelText = textLabel.text {
                    textLabel.text = textLabelText + text
                }
            }
        }
    }
}
