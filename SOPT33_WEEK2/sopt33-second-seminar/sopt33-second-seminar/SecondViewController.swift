//
//  SecondViewController.swift
//  sopt33-second-seminar
//
//  Created by 윤희슬 on 2023/10/14.
//
import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var leftStackView: UIStackView = {
        let leftStackView = UIStackView()
        leftStackView.axis = .vertical
        leftStackView.distribution = .fillEqually
        leftStackView.spacing = 0
        leftStackView.backgroundColor = .white
        return leftStackView
    }()
    private var rightStackView: UIStackView = {
        let rightStackView = UIStackView()
        rightStackView.axis = .vertical
        rightStackView.distribution = .fillEqually
        rightStackView.spacing = 0
        rightStackView.backgroundColor = .white
        
        return rightStackView
        
    }()
    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
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
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
        
        [leftStackView, rightStackView].forEach {
                            $0.translatesAutoresizingMaskIntoConstraints = false
                            contentView.addSubview($0)
                        }
        
        NSLayoutConstraint.activate([leftStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     leftStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     leftStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     leftStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])
        
        [yellowView, blackView].forEach {
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                         $0.heightAnchor.constraint(equalToConstant: 600)])
            $0.translatesAutoresizingMaskIntoConstraints = false
            leftStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([rightStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     rightStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     rightStackView.leadingAnchor.constraint(equalTo: leftStackView.trailingAnchor),
                                     rightStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     rightStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])
        
        [greenView, blueView].forEach {
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                         $0.heightAnchor.constraint(equalToConstant: 600)])
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            rightStackView.addArrangedSubview($0)
        }
    }
}
