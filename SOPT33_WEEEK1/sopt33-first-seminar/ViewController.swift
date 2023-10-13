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
    private var addressText: String = ""
    var emailList: [String] = ["naver.com", "google.com", "kakao.com", "daum.net"]
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextView.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self

    }
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func emailTextFieldSelecting(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let addressText = textField.text{
            self.addressText = addressText
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
        resultVC.setText(id: "\(idText)@\(addressText)", password: passwordText)
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

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emailList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return emailList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.emailTextView.text = self.emailList[row]
    }
}
