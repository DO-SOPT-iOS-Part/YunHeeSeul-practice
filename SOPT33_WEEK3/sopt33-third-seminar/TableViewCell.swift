import UIKit
import SnapKit
import Then

class TableViewCell: UITableViewCell {
    static let identifier: String = "TableViewCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout() {
        self.backgroundColor = .init(red: 33.0 / 255.0,
                                     green: 33.0 / 255.0,
                                     blue: 33.0 / 255.0,
                                     alpha: 1.0)
        [productImageView, stackView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
        
        productImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(128)
        }
        productImageView.layer.cornerRadius = 5
        productImageView.clipsToBounds = true
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.trailing).offset(16)
            $0.top.trailing.equalToSuperview().inset(16)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom)
            $0.trailing.bottom.equalToSuperview().inset(16)
        }
        
        [productNameLabel, locationLabel, priceLabel].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    func bindData(data: ItemListData) {
            self.productImageView.image = UIImage(named: data.image)
            self.productNameLabel.text = data.item
            self.priceLabel.text = data.price
            self.locationLabel.text = data.location
            self.likeButton.isSelected = data.isLike
    }
    
    
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 8
    }
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    private let productNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 2
        $0.textColor = .white
    }
    private let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .systemGray
    }
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .black)
        $0.textColor = .white
    }
    private lazy var likeButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(likeButtonTapped),
                     for: .touchUpInside)
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    var likeTapCompletion: ((Bool) -> Void)?

    @objc private func likeButtonTapped() {
            likeButton.isSelected.toggle()
            guard let likeTapCompletion else {return}
            likeTapCompletion(likeButton.isSelected)
        }
}
