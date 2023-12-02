import UIKit

import SnapKit
import Then

class CustomTVC: UITableViewCell {
    static let identifier: String = "CustomTVC"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(name: String,
                 isWinning: Bool,
                 age: Int) {
        self.nameLabel.text = name
        self.ageLabel.text = "\(age)"
        
        if isWinning {
            self.isWinningLable.text = "당첨!"
        } else {
            self.isWinningLable.text = ""
        }
    }
    
    private func setLayout() {
        [nameLabel, ageLabel, isWinningLable].forEach {
            self.contentView.addSubview($0)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.bottom.equalToSuperview().inset(12)
        }
        isWinningLable.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }
        ageLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalTo(nameLabel)
        }
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    private let ageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
    private let isWinningLable = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
}
