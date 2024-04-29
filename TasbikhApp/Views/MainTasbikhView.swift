//
//  MainTasbikhView.swift
//  TasbikhApp
//
//  Created by fortune cookie on 4/29/24.
//

import UIKit

class MainTasbikhView: UIView{
    
    private lazy var removeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Remove", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(removeAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(resetAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var numLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addAllSubs()
        addAllConstraints()
        backgroundColor = .systemGreen
    }
    
    private func addAllSubs(){
        let uiElementsArray = [removeButton,resetButton,addButton,numLabel]
        uiElementsArray.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        uiElementsArray.forEach({addSubview($0)})
        
    }
    
    private func addAllConstraints(){
        NSLayoutConstraint.activate([
            numLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            numLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            numLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            numLabel.heightAnchor.constraint(equalToConstant: 40),
            
            removeButton.topAnchor.constraint(equalTo: numLabel.bottomAnchor, constant: 20),
            removeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            removeButton.heightAnchor.constraint(equalToConstant: 80),
            removeButton.widthAnchor.constraint(equalToConstant: 80),
            
            resetButton.topAnchor.constraint(equalTo: numLabel.bottomAnchor, constant: 20),
            resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            resetButton.heightAnchor.constraint(equalToConstant: 80),
            resetButton.widthAnchor.constraint(equalToConstant: 80),
            
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 120),
            addButton.widthAnchor.constraint(equalToConstant: 120),
            
        ])
        [removeButton,resetButton, numLabel].forEach({$0.layer.cornerRadius = 40})
        addButton.layer.cornerRadius = 25
        
    }
    
    @objc func removeAction(){
        guard var num = Int(numLabel.text ?? "0") else { return  }
        num -= 1
        numLabel.text = String(num)
        
        if num < 0 {
            numLabel.text = "0"
        }
    }
    
    @objc func resetAction(){
        numLabel.text = "0"
        
    }
    
    @objc func addAction(){
        
        numLabel.text = String((Int(numLabel.text ?? "0") ?? 0) + 1)
    }
}
