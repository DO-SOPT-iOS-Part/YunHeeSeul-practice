import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    private var usreName: String = ""
    private var password: String = ""
    private var nickName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    @objc private func infoViewButtonTap() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
    }
    
    @objc private func registerButtonTap() {
        Task {
            do {
                let status = try await RegisterService.shared.PostRegisterData(usreName: self.usreName,
                                                                               password: self.password,
                                                                               nickName: self.nickName)
                if status == 201 {
                    let checkStatus = try await CheckNicknameService.shared.getNicknameData(username: self.usreName)!
                    if checkStatus.isExist {
                        print("check \(checkStatus.isExist)")
                        let alert = UIAlertController(title: "중복된 닉네임", message: "중복된 닉네임", preferredStyle: UIAlertController.Style.alert)
                        let okAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    }else{
                        let alert = UIAlertController(title: "계정생성 성공", message: "와하하", preferredStyle: UIAlertController.Style.alert)
                        let okAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    }
                } else {
                    let alert = UIAlertController(title: "계정생성 실패", message: "흑흑", preferredStyle: UIAlertController.Style.alert)
                    let okAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                }
                print(status)
            } catch {
                print(error)
            }
        }
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            usreName = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            nickName = textField.text ?? ""
        }
    }
    
    private func setLayout() {
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }
        
        [idTextField, passwordTextField, nickNameTextField, registerButton, infoViewButton].forEach {
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
        $0.placeholder = "아이디를 입력하슈"
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "패스워드를 입력하슈"
    }
    
    private lazy var nickNameTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "닉네임을 입력하슈"
    }
    
    private lazy var registerButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(registerButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.textColor = .white
    }
    
    private lazy var infoViewButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(infoViewButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("회원정보 조회", for: .normal)
        $0.titleLabel?.textColor = .white
    }
}
