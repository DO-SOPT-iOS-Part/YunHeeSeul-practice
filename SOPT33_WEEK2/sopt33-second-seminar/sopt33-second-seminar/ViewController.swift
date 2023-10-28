//
//  ViewController.swift
//  sopt33-second-seminar
//
//  Created by 윤희슬 on 2023/10/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
        // Do any additional setup after loading the view.
    }
    
    private var stackView1: UIStackView = {
        let stackView1 = UIStackView()
        stackView1.axis = .vertical
        stackView1.distribution = .fillEqually
        stackView1.spacing = UIScreen.main.bounds.height/4
        stackView1.backgroundColor = .white
        return stackView1
            
    }()
    private var stackView2: UIStackView = {
        let stackView2 = UIStackView()
        stackView2.axis = .vertical
        stackView2.distribution = .fillEqually
        stackView2.spacing = UIScreen.main.bounds.height/4
        stackView2.backgroundColor = .white

        return stackView2
            
    }()
    
    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    

    private var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private func setLayout(){
        self.view.addSubViews(stackView1, stackView2)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackView1.topAnchor.constraint(equalTo: view.topAnchor),
                                     stackView1.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4*3),
                                     stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     stackView1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2)])
        
        [yellowView, blackView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView1.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([stackView2.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
                                     stackView2.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4*3),
                                     stackView2.leadingAnchor.constraint(equalTo: stackView1.trailingAnchor),
                                     stackView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2)])
        
        [greenView, blueView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView2.addArrangedSubview($0)
        }
    }

}



extension UIView {
        func addSubViews(_ views: UIView...) {
                views.forEach {
                        self.addSubview($0)
                }
        }
}
