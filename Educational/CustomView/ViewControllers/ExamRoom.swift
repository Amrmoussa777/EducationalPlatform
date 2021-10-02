//
//  ExamRoom.swift
//  Educational
//
//  Created by Amr Moussa on 22/08/2021.
//

import UIKit
import AMCodeBase

class ExamRoom: UIViewController {
    let closeButton = AMPLayButton(text: "", bGColor: .systemRed, iconImage: Images.crossImage)
    let examName = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 20)
    let timerLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 15)
    let questionView = AMQuestionView<AMAnswerCell,Answer>()
    
    var exam:Exam?
    var timer:Timer?
    var timeStamp:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureLayout()
        getQuestions()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureTimer()
    }

    private func configureLayout(){
        view.addSubViews(closeButton,timerLabel,examName,questionView)
        let safeArea = view.safeAreaLayoutGuide
        let padding:CGFloat = 10
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            closeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor),
            
     
            timerLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            timerLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            timerLabel.heightAnchor.constraint(equalToConstant: 40),
            timerLabel.widthAnchor.constraint(equalToConstant:60),
            
            examName.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            examName.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: padding),
            examName.trailingAnchor.constraint(equalTo:safeArea.trailingAnchor,constant: -padding),
            examName.heightAnchor.constraint(equalToConstant: 50),
            
            questionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            questionView.topAnchor.constraint(equalTo: examName.bottomAnchor, constant: padding),
            questionView.trailingAnchor.constraint(equalTo:safeArea.trailingAnchor,constant: -padding),
            questionView.bottomAnchor.constraint(equalTo:safeArea.bottomAnchor,constant:-padding),
            
        ])
        timerLabel.configureAsTiemrLabel()
        examName.configureAsHeadline()
        closeButton.RoundCorners()
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        view.backgroundColor = .systemBackground
    }
    
    open func  getQuestions(){
//        questionView.answers = MockData.answers
//        questionView.setQuestions(questions: MockData.questions)
        examName.setText(text: exam?.name ?? "")
        
    }

    
    
    @objc open func closeTapped(){
        dismiss(animated: true)
    }
    
    open func configureTimer(){
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
        
    }
    
    @objc open func  updateTimerLabel(){
        timeStamp += 1
        let minutes = timeStamp / 60
        let seconds = timeStamp % 60
        self.timerLabel.setText(text:  String(format:"%02i:%02i", minutes, seconds))
    }
    
}




