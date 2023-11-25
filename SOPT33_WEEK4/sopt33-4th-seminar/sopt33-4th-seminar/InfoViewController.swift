import UIKit
import SnapKit
import Then

class InfoViewController: UIViewController {

    private var userId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
    }
    
    @objc private func searchButtonTap() {
        Task {
            if let result = try await GetInfoService.shared.GetRegisterData(userId: Int(self.userId) ?? 1) {
                self.infoLabel.text = "userName: \(result.username)\nnickName: \(result.nickname)"
            }
        }
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        self.userId = textField.text ?? ""
    }
    
    private func setLayout() {
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }
        
        [idTextField, infoLabel, searchButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }
    private lazy var idTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "검색할 유저 아이디를 입력하세요"
    }
    
    private lazy var searchButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(searchButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("검색", for: .normal)
        $0.titleLabel?.textColor = .white
    }
    
    private lazy var infoLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
}
