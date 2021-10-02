//
//  LeftOfView.swift
//  Educational
//
//  Created by Amr Moussa on 17/08/2021.
//

import UIKit
import AMCodeBase
#warning("add to AM package")
class LeftOffView: UIView {
    
    let imageView = AMAvatarImage(frame: .zero ,tintColor: .green)
    let label    = AMItemLable(textAlignment: .left, NoOfLines: 0, size: 20)
    let playButton = AMPLayButton(text: "", bGColor: .systemGreen, iconImage: EDImages.playImage)
    
    var NextplayLesson:lesson?
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        setGradient()
    }
    
    private func configureLayout(){
        RoundCorners()
        addShadow()
        addSubViews(imageView,label,playButton)
        imageView.pinToSuperViewEdges(in: self)
        label.configureAsProfileHeadline()
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            label.heightAnchor.constraint(equalToConstant: 50),

            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            playButton.widthAnchor.constraint(equalToConstant: 50),
        ])
        
        translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }
    
    @objc func playButtonTapped(){
        guard let lesson = NextplayLesson else {
            return
        }
        let detaledView = DetaieldLessonVC()
        detaledView.lesson = lesson
        detaledView.modalPresentationStyle = .fullScreen
        EDNetworkManager.shared.currentRootVC?.present(detaledView, animated: true)
    }
    
    open func setGradient(){
                
        let width = self.bounds.width
        let height = self.bounds.height
        let sHeight:CGFloat = 70
        let shadow = UIColor.black.withAlphaComponent(0.9).cgColor

        let bottomImageGradient = CAGradientLayer()
        bottomImageGradient.frame = CGRect(x: 0, y: height - sHeight, width: width, height: sHeight)
        bottomImageGradient.colors = [UIColor.clear.cgColor, shadow]
        imageView.layer.insertSublayer(bottomImageGradient, at: 0)
      
    }
    // set with url
    open func setData(lesson:lesson){
        let lastLesson = EDNetworkManager.shared.getLatsVideo()
        NextplayLesson = lastLesson ?? lesson
        let FirstVideoID = EDNetworkManager.shared.getVideoIDFromLesson(lesson:lastLesson ?? lesson)
        let thumbnailLink = "https://img.youtube.com/vi/\(FirstVideoID)/0.jpg"
        imageView.downloadImage(fromURL: thumbnailLink)
        label.text = lastLesson?.name ?? lesson.name
    }
    
    
}



