//
//  ResultViewController.swift
//  sopt33-first-seminar
//
//  Created by 윤희슬 on 2023/10/07.
//

import UIKit

class ResultViewController: UIViewController {
    var email: String = ""
    var password: String = ""
    
    var delegate: GetDataProtocol?
    
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    private func bindText() {
        self.emailLabel.text = "email : \(email)"
        self.passwordLabel.text = "password : \(password)"
    }
    
    func setText(id: String, password: String){
        self.email = id
        self.password = password
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonTap(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }else{
            self.dismiss(animated: true)
        }
//        delegate?.getLoginData(email: self.email, password: self.password)
        guard let loginDataCompletion else {return}
        loginDataCompletion([self.email, self.password])
    }
}
