//
//  ScoreViewController.swift
//  Quiz Me
//
//  Created by Admin on 9/12/22.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var scorelabel : UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    let retryButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Retry", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = .systemFont(ofSize: 20)
        return button
    }()
    
    let homeButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Home", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemGreen
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 20)
        return button
    }()

    
    var score : Int
    var category : String
    
    init(score : Int, category : String) {
        self.score = score
        self.category = category
        super.init(nibName: nil, bundle: nil)
        getScoreText(with: score)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        retryButton.addTarget(self, action: #selector(retryTapped), for: .touchUpInside)
        homeButton.addTarget(self, action: #selector(homeTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
     @objc private func retryTapped() {
        let vc = QuestionViewController(category: category)
         navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func homeTapped() {
        navigationController?.popToRootViewController(animated: true)
   }
    
    func getScoreText(with score : Int) {
        if score < 6 {
            view.backgroundColor = .systemRed
            scorelabel.text = "Your score is \(score). You didn't pass."
        }
        else if score > 7 {
            view.backgroundColor = .systemGreen
            scorelabel.text = "Your score is \(score). Great Job! Try another Category."
        } else {
            view.backgroundColor = .systemYellow
            scorelabel.text = "Your score is \(score). I suggest trying again. "
        }
    }
    
    private func configureUI() {
        view.addSubview(scorelabel)
        view.addSubview(retryButton)
        view.addSubview(homeButton)
        view.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            scorelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            scorelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scorelabel.heightAnchor.constraint(equalToConstant: 60),
            scorelabel.widthAnchor.constraint(equalToConstant: 200),
            
            retryButton.topAnchor.constraint(equalTo: scorelabel.bottomAnchor, constant: 50),
            retryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            retryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            retryButton.heightAnchor.constraint(equalToConstant: 50),
            
            homeButton.topAnchor.constraint(equalTo: retryButton.bottomAnchor, constant: 20),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            homeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            homeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
