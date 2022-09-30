//
//  QuestionViewController.swift
//  Quiz Me
//
//  Created by Admin on 9/17/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    let questionLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    var stackView : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    var numberOfQuestionLabel : UILabel = {
       var label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    var score = 0
    var tag = 0
    var index = 0 
    var category : String
    var currentQuestion : String!
    var correctAnswer : String?
    var currentAnswers : [String]!
    var questions : [Question]!
    var answerTag : Int!
    
    init(category : String) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getQuestion(categoryName: category) { [weak self] questions in
            
            DispatchQueue.main.async {
                self?.questions = questions
                self?.getNextQuestion(newIndex: 0)
                self?.title = self?.updateTitle(oldName: self?.category)
                self?.configureUI()
                self?.setup()
                self?.numberOfQuestionLabel.text = "Question \(self!.index + 1) out of 10"
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.setHidesBackButton(true, animated: true)
        let textAttributes = [NSAttributedString.Key.foregroundColor : UIColor.label]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func getNextQuestion(newIndex : Int) {
        currentAnswers = questions[newIndex].incorrectAnswers
        currentAnswers.append(questions[newIndex].correctAnswer)
        correctAnswer = questions[newIndex].correctAnswer
        currentQuestion = questions[newIndex].question
    }

    private func configureUI() {
        let shuffledArray = currentAnswers.shuffled()
        for i in 0..<shuffledArray.count {
            if shuffledArray[i] == correctAnswer {
                answerTag = i
            }
        }
    
        questionLabel.text = currentQuestion
        for answer in shuffledArray {
            let button = UIButton()
            button.setTitle(answer, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 20
            button.layer.borderColor = UIColor.systemRed.cgColor
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = .systemFont(ofSize: 15)
            button.setTitleColor(.label, for: .normal)
            button.titleLabel?.numberOfLines = 0
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
            button.tag = tag
            tag += 1
            button.backgroundColor = .lightGray
            stackView.addArrangedSubview(button)
        }
    }
    
    private func setup() {
        view.addSubview(questionLabel)
        view.addSubview(stackView)
        view.addSubview(numberOfQuestionLabel)
        view.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.heightAnchor.constraint(equalToConstant: 120),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            stackView.bottomAnchor.constraint(equalTo: numberOfQuestionLabel.bottomAnchor, constant: -40),
            
            numberOfQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberOfQuestionLabel.heightAnchor.constraint(equalToConstant: 20),
            numberOfQuestionLabel.widthAnchor.constraint(equalToConstant: 200),
            numberOfQuestionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func buttonClicked(sender : UIButton!) {
        
        switch sender.tag {
        case 0 :
            self.stackView.toggleUserPressed()
            if checkAnswer(answer: sender.titleLabel!.text!) {
                score += 1
                sender.layer.backgroundColor = UIColor.systemGreen.cgColor
            }
            else {
                sender.layer.backgroundColor = UIColor.systemRed.cgColor
                stackView.subviews[answerTag].backgroundColor = .systemGreen
            }
            DispatchQueue.main.async {
                self.animate(sender)
            }
        case 1 :
            self.stackView.toggleUserPressed()
            if checkAnswer(answer: sender.titleLabel!.text!) {
                score += 1
                sender.layer.backgroundColor = UIColor.systemGreen.cgColor
            }
            else {
                sender.layer.backgroundColor = UIColor.systemRed.cgColor
                stackView.subviews[answerTag].backgroundColor = .systemGreen
            }
            DispatchQueue.main.async {
                self.animate(sender)
            }
        case 2 :
            self.stackView.toggleUserPressed()
            if checkAnswer(answer: sender.titleLabel!.text!) {
                score += 1
                sender.layer.backgroundColor = UIColor.systemGreen.cgColor
            }
            else {
                sender.layer.backgroundColor = UIColor.systemRed.cgColor
                stackView.subviews[answerTag].backgroundColor = .systemGreen
            }
            DispatchQueue.main.async {
                self.animate(sender)
            }
        case 3 :
            self.stackView.toggleUserPressed()
            if checkAnswer(answer: sender.titleLabel!.text!) {
                score += 1
                sender.layer.backgroundColor = UIColor.systemGreen.cgColor
            }
            else {
                sender.layer.backgroundColor = UIColor.systemRed.cgColor
                stackView.subviews[answerTag].backgroundColor = .systemGreen
            }
            DispatchQueue.main.async {
                self.animate(sender)
            }
        default:
            break
        }
    }
    
    @objc private func wrongButtonClicked(sender : UIButton!) {
        sender.layer.backgroundColor = UIColor.systemRed.cgColor
        
        stackView.subviews[answerTag].backgroundColor = .systemGreen
        
    }
    
    @objc private func rightButtonClicked(sender : UIButton!) {
        score += 1
        sender.layer.backgroundColor = UIColor.systemGreen.cgColor
        self.animate(sender)
    }
    
    private func animate(_ viewToAnimate : UIView) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: .curveEaseIn) {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        } completion: { _ in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn) {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { _ in
                if self.index < 9 {
                    self.index += 1
                    self.getNextQuestion(newIndex: self.index)
                    self.tag = 0
                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        self.stackView.removeFullyArrangedSubviews()
                        self.configureUI()
                        self.updateQuestionNumber()
                    }
                }
                else {
                    self.navigationController?.pushViewController(ScoreViewController(score: self.score, category: self.category), animated: true)
                }
            }
        }
    }
    
    func checkAnswer(answer : String) -> Bool {
        if answer == correctAnswer {
            return true
        }
        return false
    }
    
    func updateQuestionNumber() {
        self.numberOfQuestionLabel.text = "Question \(self.index + 1) out of 10"
    }
    
    func updateTitle(oldName : String?) -> String {
        guard let oldName = oldName else {
            return ""
        }
        let newName = oldName.replacingOccurrences(of: "_", with: " ")
        let newNameUpper = newName.uppercased()
        return newNameUpper
    }
}
