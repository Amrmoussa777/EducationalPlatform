//
//  MoreCVCell.swift
//  Educational
//
//  Created by Amr Moussa on 29/09/2021.
//



import UIKit
import AMCodeBase


class MoreCell: AMCollectionViewCell {
    
    let imageView = AMAvatarImage(frame: .zero, tintColor: .systemGreen.withAlphaComponent(0.6))
    let label  = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 20)
    static var cellID: String = "MoreCEll"
    
    func updateItem(item: Codable) {
        guard let moreItem = item as? MoreItem else { return  }
        
        label.setText(text: moreItem.Label)
        DispatchQueue.main.async {
            self.imageView.image = UIImage(systemName: moreItem.imagePath)
        }
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLyout(){
        addSubViews(imageView,label)
        let padding:CGFloat = 20
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            label.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            label.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -padding),
        ])
        imageView.contentMode = .scaleToFill
        label.textColor = .systemGray2
        backgroundColor = .systemBackground
    }
    
    
    
}

