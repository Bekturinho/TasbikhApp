//
//  ViewController.swift
//  TasbikhApp
//
//  Created by fortune cookie on 4/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.text = "Tasbikh Tracker"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var mainTasbikhView: MainTasbikhView = {
        MainTasbikhView()
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(mainTasbikhView)
        mainTasbikhView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainTitle)
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTasbikhView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTasbikhView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainTasbikhView.heightAnchor.constraint(equalToConstant: 350),
            mainTasbikhView.widthAnchor.constraint(equalToConstant: 350),
            
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            
            
        ])
        mainTasbikhView.layer.cornerRadius = 30
    }


}

