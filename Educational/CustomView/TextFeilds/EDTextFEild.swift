//
//  EDTextFEild.swift
//  Educational
//
//  Created by Amr Moussa on 30/09/2021.
//

import UIKit
import  AMCodeBase

class EDTextFEild: AMTextFeild {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(placeHolder:String,placeholderImage:UIImage) {
        super.init(placeHolder: placeHolder, placeholderImage: placeholderImage)
    }
    
    override func configure(_ plaHolder: String, _ placeHolderImage: UIImage) {
        let attachment = NSTextAttachment()
        attachment.image = placeHolderImage.withTintColor(.systemGray2)
        attachment.bounds = CGRect(x: 0, y: -5, width: 23, height: 20)
        
        let attachmentStr = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: "   ")
        myString.append(attachmentStr)
        let myString1 = NSMutableAttributedString(string:"  " + plaHolder,attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold),])
        myString.append(myString1)
        self.attributedPlaceholder = myString
        
        textAlignment = .right
        
        
        
        RoundCorners()
        AddStroke(color: .lightGray.withAlphaComponent(0.3))
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10,dy: 0)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10,dy: 0)
    }
    
}

