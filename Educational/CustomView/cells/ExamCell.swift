//
//  ExamCell.swift
//  Educational
//
//  Created by Amr Moussa on 20/08/2021.
//

import UIKit
import  AMCodeBase

class ExamCell: AMCollectionViewCell{
    
    static var cellID: String = "ExamCellID"
    
    let nameLabel = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 20)
    let statusLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 16)
    let noOfQuest = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 15)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubViews(nameLabel,statusLabel,noOfQuest)
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.5),
            
            statusLabel.widthAnchor.constraint(equalToConstant: 60),
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            
            noOfQuest.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            noOfQuest.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            noOfQuest.heightAnchor.constraint(equalToConstant: 30),
            noOfQuest.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.5),
        ])
        nameLabel.configureAsProfileHeadline()
        statusLabel.RoundCorners()
        statusLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        noOfQuest.configureAsConversationMessage()
    }
    
    func updateItem(item: Codable) {
        guard let exam = item as? Exam else {
            return
        }
        nameLabel.setText(text: exam.name)
        noOfQuest.setText(text: "Questions: " + String(exam.NoOfQuestions))
        exam.status == "Active" ? setActiveState():setDoneState()
    }
    
    
    private func setActiveState(){
        statusLabel.text = "Active"
        statusLabel.backgroundColor = .systemGreen
        statusLabel.textColor = .white
    }
    
    private func setDoneState(){
        statusLabel.text = "Done"
        statusLabel.backgroundColor = .systemBlue
        statusLabel.textColor = .white
    }
    
}



