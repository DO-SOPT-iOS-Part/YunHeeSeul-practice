//
//  ViewController.swift
//  sopt33-first-seminar
//
//  Created by 윤희슬 on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    private var idText: String = ""
    private var passwordText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func pwTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let pwText = textField.text {
            self.passwordText = pwText
        }
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
        pushToResultVC()
    }
    
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.setText(id: idText, password: passwordText)
        self.navigationController?.pushViewController(resultVC, animated: true)
        //        resultVC.delegate = self
        resultVC.loginDataCompletion = {
            data in print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }
    }
    
    func presentToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.setText(id: idText, password: passwordText)
        self.present(resultVC, animated: true)
    }
    
    
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
