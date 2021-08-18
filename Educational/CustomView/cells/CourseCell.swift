//
//  CourseCell.swift
//  Educational
//
//  Created by Amr Moussa on 17/08/2021.
//

import UIKit
import AMCodeBase

class CourseCell: UICollectionViewCell {
    static let cellID = "cellID"
    
    let avatarImage = AMAvatarImage(frame: .zero,tintColor: .systemGreen)
    let nameLabel = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 17)
    let descriptionLabel = AMItemLable(textAlignment: .left, NoOfLines: 3, size: 15)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubViews(avatarImage,nameLabel,descriptionLabel)
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            avatarImage.widthAnchor.constraint(equalTo: avatarImage.heightAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: padding),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
        ])
        descriptionLabel.configureAsConversationMessage()
        backgroundColor = .systemBackground
    }
    
    func addCourse(course:Lesson){
        avatarImage.downloadImage(fromURL: course.imgLink)
        avatarImage.image = EDImages.thumbnail
        
        nameLabel.setText(text: course.name)
        descriptionLabel.setText(text: course.descritption)
        
    }
    
    
    
}

