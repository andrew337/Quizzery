//
//  QuestionButton.swift
//  Quiz Me
//
//  Created by Admin on 8/29/22.
//

import UIKit

class QuestionButton: UIButton {
    
    init(question : String) {
        
        super.init(frame: .zero)
        configure()
        self.titleLabel?.text = question
        
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configure()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .tinted()
        configuration = .bordered()
        layer.borderColor = UIColor.systemRed.cgColor
        configuration?.cornerStyle = .medium
        titleLabel?.numberOfLines = 0
        titleLabel?.font = .systemFont(ofSize: 12)
    }
}
