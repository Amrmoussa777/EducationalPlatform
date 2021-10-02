//
//  ExamsVC.swift
//  Educational
//
//  Created by Amr Moussa on 16/08/2021.
//

import UIKit
import AMCodeBase

class ExamsVC: AMCollectionViewController<ExamCell, Exam>{
    
//
//    let progress = AMProgressView()
//    let welcomeCard = AMWelcomeCard()
//    var exams:[Exam]  = []
    let soonLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 25)
    override func viewDidLoad() {
        super.viewDidLoad()
        EDNetworkManager.shared.currentRootVC = self
        configureLayout()
        loadExams()
        rightAlignedLargeTitle()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        EDNetworkManager.shared.currentRootVC = self
    }
    
    private func configureLayout(){
        view.backgroundColor = .systemGray6
        view.addSubViews(soonLabel)
        
        NSLayoutConstraint.activate([
            soonLabel.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            soonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            soonLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            soonLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        soonLabel.setText(text: EDStrings.soon)
        soonLabel.textColor = .systemGray2
//        view.addSubViews(progress,AMCollectionView,welcomeCard)
//        let padding:CGFloat = 10
//        let safeArea = view.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([
//
//            progress.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.3  ),
//            progress.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
//            progress.heightAnchor.constraint(equalToConstant: 140),
//            progress.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
//
//            welcomeCard.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: padding  ),
//            welcomeCard.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
//            welcomeCard.heightAnchor.constraint(equalToConstant: 140),
//            welcomeCard.trailingAnchor.constraint(equalTo: progress.leadingAnchor,constant: padding),
//
//            AMCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
//            AMCollectionView.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: padding),
//            AMCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -padding),
//            AMCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant:  -padding)
//        ])
//        AMCollectionView.RoundCorners()
    }
    
    private func loadExams(){
//        exams = MockData.exams
//        UpadateItem(items: exams)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        progress.setPrecentage(percentage: 0.5)
//        welcomeCard.setName(name: EDStrings.userNamePlaceHolder, subText: EDStrings.whichExam)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let exam  = exams[indexPath.row]
//        let examRoomVC = ExamRoom()
//        examRoomVC.exam = exam
//        examRoomVC.modalPresentationStyle = .fullScreen
//        present(examRoomVC, animated: true)
    }
    
}



