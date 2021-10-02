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


class unitCell: AMCollectionViewCell {
    static var cellID: String = "cellID"
    
    let avatarImage = AMAvatarImage(frame: .zero,tintColor: .systemGreen)
    let nameLabel = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 17)
    let descriptionLabel = AMItemLable(textAlignment: .right, NoOfLines: 3, size: 15)
    
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
            avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            avatarImage.widthAnchor.constraint(equalTo: avatarImage.heightAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: avatarImage.leadingAnchor,constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: avatarImage.leadingAnchor,constant: -padding),
        ])
        descriptionLabel.configureAsConversationMessage()
        backgroundColor = .systemBackground
        
    }
   
    
    func updateItem(item: Codable) {
        guard let unit = item as? Unit else {
            return
        }
        
        
        avatarImage.image = EDImages.thumbnail
        var FirstVideoID = ""
       

        if unit.lessons.count > 0 {
            FirstVideoID =  unit.lessons[0].youtubeId
           
//        for i in 0...min(unit.lessons.count - 1, 3) {descText.append(unit.lessons[i].name + " \n")}
        }
        
        let thumbnailLink = "https://img.youtube.com/vi/\(FirstVideoID)/0.jpg"
        avatarImage.downloadImage(fromURL: thumbnailLink)
        nameLabel.setText(text: unit.name)
        descriptionLabel.setText(text: unit.disc)

    }
    
    
    
}

