//
//  CourseCell.swift
//  Educational
//
//  Created by Amr Moussa on 17/08/2021.
//

import UIKit
import AMCodeBase

//  CourseCell.swift
//  Educational
//
//  Created by Amr Moussa on 17/08/2021.
//


class LessonCell: AMCollectionViewCell {
    static var cellID: String = "lessonCell"
    
    let avatarImage = AMAvatarImage(frame: .zero,tintColor: .systemGray6)
    let nameLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 25)
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubViews(avatarImage,nameLabel)
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            avatarImage.topAnchor.constraint(equalTo: topAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarImage.heightAnchor.constraint(equalTo: widthAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor
            ),
            nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: -padding),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
        ])
        
        nameLabel.backgroundColor = .systemBackground
        backgroundColor = .systemBackground
        RoundCorners()
        addShadow()
        
    }
   
    
    func updateItem(item: Codable) {
        guard let lesson = item as? lesson else {
            return
        }
        
        avatarImage.image = EDImages.thumbnail
        var FirstVideoID = ""
        var descText = ""
        
        FirstVideoID = lesson.youtubeId
        let timeAge = lesson.createdAt.getDate()?.timeAgoDisplay()
            descText.append(timeAge ?? "_")
        let thumbnailLink = "https://img.youtube.com/vi/\(FirstVideoID)/0.jpg"
        avatarImage.downloadImage(fromURL: thumbnailLink)
        nameLabel.setText(text: lesson.name)
        nameLabel.configureAsProfileHeadline()
    
    }
    
    
    
}

